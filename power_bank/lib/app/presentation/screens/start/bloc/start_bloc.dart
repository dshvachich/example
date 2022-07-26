import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:power_bank/app/navigation/navigate_action.dart';
import 'package:power_bank/app/navigation/navigation_type.dart';
import 'package:power_bank/core/bloc/base_bloc_state.dart';
import 'package:power_bank/core/bloc/bloc_action.dart';
import 'package:power_bank/core/failures.dart';
import 'package:power_bank/data/gateways/local/preferences_local_gateway.dart';
import 'package:power_bank/data/repositories/product_rent_repository.dart';
import 'package:power_bank/data/repositories/settings_repository.dart';
import 'package:power_bank/data/repositories/user_repository.dart';
import 'package:power_bank/di/injection.dart';
import 'package:power_bank/domain/entities/network/settings.dart';
import 'package:power_bank/domain/entities/network/user.dart';

part 'start_bloc.freezed.dart';
part 'start_event.dart';
part 'start_state.dart';

class StartBloc extends Bloc<StartEvent, StartState> {
  StartBloc({
    required this.preferencesLocalGateway,
    required this.productRentRepository,
    required this.settingsRepository,
    required this.userRepository,
  }) : super(StartState()) {
    on<Init>(_init);
    on<RepeatClicked>(_repeatClicked);
    this.add(StartEvent.init());
  }

  PreferencesLocalGateway preferencesLocalGateway;
  ProductRentRepository productRentRepository;
  SettingsRepository settingsRepository;
  UserRepository userRepository;

  FutureOr<void> _init(
    Init event,
    Emitter<StartState> emit,
  ) async {
    await _getData(emit);
  }

  Future<void> _getData(Emitter<StartState> emit) async {
    Either<Settings, Failure> result = await settingsRepository.getSettings();
    Settings? settings;
    Failure? error;
    result.fold(
      (data) => settings = data,
      (failure) => error = failure,
    );

    emit(state.copyWith(action: null));
    if (settings != null) {
      await Locator.registerSettings(settings!);

      emit(state.copyWith(action: RegisterLocalization()));

      String? token = await preferencesLocalGateway.getToken();
      if (token != null) {
        User? user = await _getUser(emit);
        if (user != null) {
          await Locator.registerUser(user);
          emit(
            state.copyWith(
              action: NavigateAction.navigateToNavigation(
                NavigateType.pushReplacement,
                settings: settings!,
                user: user,
              ),
            ),
          );
        } else {
          emit(state.copyWith(action: NavigateAction.navigateToAuthorization(NavigateType.pushReplacement)));
        }
      } else {
        emit(state.copyWith(action: NavigateAction.navigateToAuthorization(NavigateType.pushReplacement)));
      }
    } else {
      emit(state.copyWith(action: ShowErrorMessage()));
    }
  }

  Future<User?> _getUser(Emitter<StartState> emit) async {
    Either<User, Failure> result = await userRepository.getUser();

    User? user;
    Failure? error;

    result.fold(
      (data) => user = data,
      (failure) => error = failure,
    );

    if (error == null) {
      return user;
    }
    return null;
  }

  Future<FutureOr<void>> _repeatClicked(
    RepeatClicked event,
    Emitter<StartState> emit,
  ) async {
    await _getData(emit);
  }
}
