import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:power_bank/app/navigation/navigate_action.dart';
import 'package:power_bank/app/navigation/navigation_type.dart';
import 'package:power_bank/core/bloc/base_bloc_state.dart';
import 'package:power_bank/core/bloc/bloc_action.dart';
import 'package:power_bank/core/entities/phone_number.dart';
import 'package:power_bank/core/failures.dart';
import 'package:power_bank/core/utils/base_error_handler.dart';
import 'package:power_bank/data/gateways/local/preferences_local_gateway.dart';
import 'package:power_bank/data/repositories/authorization_repository.dart';
import 'package:power_bank/data/repositories/user_repository.dart';
import 'package:power_bank/di/injection.dart';
import 'package:power_bank/domain/entities/network/user.dart';
import 'package:power_bank/domain/entities/token_entity.dart';
import 'package:power_bank/localization/app_localizations.dart';

part 'confirm_phone_bloc.freezed.dart';
part 'confirm_phone_event.dart';
part 'confirm_phone_state.dart';

class ConfirmPhoneBloc extends Bloc<ConfirmPhoneEvent, ConfirmPhoneState> {
  ConfirmPhoneBloc({
    required PhoneNumber phone,
    required this.authorizationRepository,
    required this.localization,
    required this.preferencesLocalGateway,
    required this.userRepository,
  }) : super(ConfirmPhoneState(phone: phone)) {
    on<Init>(_init);
    on<ResendCodeClicked>(_resendCodeClicked);
    on<CountOfSecondsToResendChanged>(_countOfSecondsToResendChanged);
    on<CodeChanged>(_codeChanged);
    on<EnterClicked>(_enterClicked);
    on<BackClicked>(_backClicked);
    this.add(ConfirmPhoneEvent.init());
  }

  AuthorizationRepository authorizationRepository;
  UserRepository userRepository;
  AppLocalizations localization;
  PreferencesLocalGateway preferencesLocalGateway;

  Timer? _timer;
  int _currentCountSecondsToResend = 0;

  static const int _countSecondsToResend = 30;

  FutureOr<void> _init(
    Init event,
    Emitter<ConfirmPhoneState> emit,
  ) {
    _resetTimer();
  }

  FutureOr<void> _resendCodeClicked(
    ResendCodeClicked event,
    Emitter<ConfirmPhoneState> emit,
  ) async {
    if (state.countOfSecondsToResend <= 0) {
      _resetTimer();
      await _resendCode(emit);
    }
  }

  FutureOr<void> _countOfSecondsToResendChanged(
    CountOfSecondsToResendChanged event,
    Emitter<ConfirmPhoneState> emit,
  ) {
    emit(state.copyWith(countOfSecondsToResend: event.countSecondsToResendChanged, buttonEnabled: _buttonEnabled));
  }

  FutureOr<void> _codeChanged(
    CodeChanged event,
    Emitter<ConfirmPhoneState> emit,
  ) {
    emit(state.copyWith(code: event.code, buttonEnabled: _buttonEnabled));
  }

  FutureOr<void> _enterClicked(
    EnterClicked event,
    Emitter<ConfirmPhoneState> emit,
  ) async {
    if (!state.isLoading) {
      await _loginByPhone(emit);
    }
  }

  Future<void> _loginByPhone(Emitter<ConfirmPhoneState> emit) async {
    emit(state.copyWith(isLoading: true));

    String phone = state.phone.getRawNumber();

    TokenEntity? token;
    Failure? error;
    Either<TokenEntity, Failure>? result =
        await authorizationRepository.loginByPhone(code: state.code ?? '', phone: phone);
    result.fold(
      (data) => token = data,
      (failure) => error = failure,
    );

    emit(state.copyWith(action: null));
    if (error == null && token != null) {
      await preferencesLocalGateway.setToken(token!.accessToken);
      User? user;
      Either<User, Failure> result = await userRepository.getUser();
      result.fold(
        (data) => user = data,
        (failure) => {},
      );

      if (user != null) {
        await Locator.registerUser(user!);
        emit(
          state.copyWith(
            action: NavigateAction.navigateToNavigation(
              NavigateType.pushAndRemoveUntil,
              settings: Locator.injection(),
              user: Locator.injection(),
            ),
          ),
        );
      } else {
        emit(state.copyWith(action: ShowSnackBarMessage(message: BaseErrorHandler.handleError(error!, localization))));
      }
    } else {
      emit(state.copyWith(action: ShowSnackBarMessage(message: BaseErrorHandler.handleError(error!, localization))));
    }
    emit(state.copyWith(isLoading: false));
  }

  void _resetTimer() {
    _timer?.cancel();
    _currentCountSecondsToResend = _countSecondsToResend;
    this.add(CountOfSecondsToResendChanged(_currentCountSecondsToResend));
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentCountSecondsToResend > 0) {
        this.add(CountOfSecondsToResendChanged(--_currentCountSecondsToResend));
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> _resendCode(Emitter<ConfirmPhoneState> emit) async {
    String phone = state.phone.getRawNumber();
    Either<bool, Failure> result = await authorizationRepository.sendSmsCode(phone: phone);

    Failure? error;
    result.fold(
      (data) => {},
      (failure) => error = failure,
    );

    emit(state.copyWith(action: null));
    if (error != null) {
      emit(state.copyWith(action: ShowSnackBarMessage(message: BaseErrorHandler.handleError(error!, localization))));
    }
  }

  FutureOr<void> _backClicked(
    BackClicked event,
    Emitter<ConfirmPhoneState> emit,
  ) {
    emit(state.copyWith(action: NavigateAction.navigateBack()));
  }

  bool get _buttonEnabled {
    bool buttonEnabled = false;
    if ((state.code?.length ?? 0) >= 5) {
      buttonEnabled = true;
    } else {
      if (state.countOfSecondsToResend > 0) {
        buttonEnabled = false;
      } else {
        buttonEnabled = true;
      }
    }
    return buttonEnabled;
  }
}
