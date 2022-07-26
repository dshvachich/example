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
import 'package:power_bank/core/validation/validation_models.dart';
import 'package:power_bank/data/repositories/authorization_repository.dart';
import 'package:power_bank/domain/entities/network/settings.dart';
import 'package:power_bank/localization/app_localizations.dart';

part 'authorization_bloc.freezed.dart';
part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationBloc({
    required this.authorizationRepository,
    required this.settings,
    required this.localization,
  }) : super(AuthorizationState()) {
    on<PhoneChanged>(_phoneChanged);
    on<SendCodeClicked>(_sendCodeClicked);
    on<PrivacyPolicyClicked>(_privacyPolicyClicked);
    on<TermsOfUseClicked>(_termsOfUseClicked);
    on<StartNumberEntering>(_startNumberEntering);
    on<EndNumberEntering>(_endNumberEntering);
    on<BackClicked>(_backClicked);
  }

  AuthorizationRepository authorizationRepository;
  Settings settings;
  AppLocalizations localization;

  FutureOr<void> _phoneChanged(
    PhoneChanged event,
    Emitter<AuthorizationState> emit,
  ) {
    bool isValid = event.phone.getRawNumber().length == 11;
    emit(state.copyWith(phone: PhoneForm.pure(event.phone, isValid), buttonEnabled: isValid));
  }

  Future<FutureOr<void>> _sendCodeClicked(
    SendCodeClicked event,
    Emitter<AuthorizationState> emit,
  ) async {
    if (!state.isLoading) {
      if (state.phone.valid) {
        await _logIn(emit);
      } else {
        emit(state.copyWith(phone: PhoneForm.dirty(state.phone.value, state.phone.isValid)));
      }
    }
  }

  FutureOr<void> _privacyPolicyClicked(
    PrivacyPolicyClicked event,
    Emitter<AuthorizationState> emit,
  ) {}

  FutureOr<void> _termsOfUseClicked(
    TermsOfUseClicked event,
    Emitter<AuthorizationState> emit,
  ) {}

  Future<void> _logIn(Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(isLoading: true));
    String phone = state.phone.getRawNumber();

    bool? success;
    Failure? error;

    Either<bool, Failure>? result = await authorizationRepository.sendSmsCode(phone: phone);
    result.fold(
      (data) => success = data,
      (failure) => error = failure,
    );

    emit(state.copyWith(action: null));
    if (error == null && success == true) {
      emit(state.copyWith(action: NavigateAction.navigateToConfirmPhone(NavigateType.push, phone: state.phone.value!)));
    } else {
      emit(state.copyWith(action: ShowSnackBarMessage(message: BaseErrorHandler.handleError(error!, localization))));
    }
    emit(state.copyWith(isLoading: false));
  }

  FutureOr<void> _startNumberEntering(
    StartNumberEntering event,
    Emitter<AuthorizationState> emit,
  ) {
    emit(state.copyWith(numberEntering: true));
  }

  FutureOr<void> _endNumberEntering(
    EndNumberEntering event,
    Emitter<AuthorizationState> emit,
  ) {
    emit(state.copyWith(numberEntering: false));
  }

  FutureOr<void> _backClicked(
    BackClicked event,
    Emitter<AuthorizationState> emit,
  ) {
    emit(state.copyWith(action: null));
    emit(state.copyWith(action: HideKeyboard(), numberEntering: false));
  }
}
