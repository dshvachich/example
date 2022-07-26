import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:power_bank/app/navigation/navigate_action.dart';
import 'package:power_bank/app/navigation/navigation_type.dart';
import 'package:power_bank/core/bloc/base_bloc_state.dart';
import 'package:power_bank/core/bloc/bloc_action.dart';
import 'package:power_bank/data/gateways/local/preferences_local_gateway.dart';
import 'package:power_bank/data/repositories/notifications_repository.dart';
import 'package:power_bank/data/repositories/product_rent_repository.dart';
import 'package:power_bank/data/web_socket_manager.dart';
import 'package:power_bank/di/injection.dart';
import 'package:power_bank/domain/entities/network/product_rent.dart';
import 'package:power_bank/domain/entities/network/settings.dart';
import 'package:power_bank/domain/entities/network/user.dart';
import 'package:power_bank/domain/enums/menu_item.dart';
import 'package:power_bank/localization/app_localizations.dart';

part 'navigation_bloc.freezed.dart';
part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc({
    required Settings settings,
    required this.productRentRepository,
    required this.preferencesLocalGateway,
    required this.socketManager,
    required this.localization,
    required this.notificationsRepository,
    required User user,
  }) : super(NavigationState(settings: settings, user: user)) {
    on<Init>(_init);
    on<MenuItemSelected>(_menuItemSelected);
    on<MenuClicked>(_menuClicked);
    on<RentCompleted>(_rentCompleted);
    on<BackClicked>(_backClicked);
    on<ExitClicked>(_exitClicked);
    on<Logout>(_logout);
    on<DrawerStateChanged>(_drawerStateChanged);
    this.add(NavigationEvent.init());
  }

  ProductRentRepository productRentRepository;
  WebSocketManager socketManager;
  PreferencesLocalGateway preferencesLocalGateway;
  AppLocalizations localization;
  NotificationsRepository notificationsRepository;

  StreamSubscription<ProductRent?>? _completeRentSubscription;
  StreamSubscription<ProductRent?>? _failRentSubscription;

  FutureOr<void> _init(
    Init event,
    Emitter<NavigationState> emit,
  ) async {
    _completeRentSubscription = socketManager.completeRentStream.listen((product) {
      this.add(NavigationEvent.rentCompleted());
    });
    _failRentSubscription = socketManager.failRentStream.listen((product) {
      this.add(NavigationEvent.rentCompleted());
    });
    await _getActiveRent(emit);
  }

  @override
  Future<void> close() async {
    _completeRentSubscription?.cancel();
    _failRentSubscription?.cancel();
    return super.close();
  }

  FutureOr<void> _menuItemSelected(
    MenuItemSelected event,
    Emitter<NavigationState> emit,
  ) async {
    emit(state.copyWith(action: null));
    switch (event.item) {
      case MenuItem.paymentMethods:
        break;
      case MenuItem.tariffs:
        break;
      case MenuItem.support:
        break;
      case MenuItem.aboutService:
        break;
    }
  }

  FutureOr<void> _menuClicked(MenuClicked event, Emitter<NavigationState> emit) {
    emit(state.copyWith(action: null));
    if (state.drawerIsOpen) {
      emit(state.copyWith(action: CloseDrawer(), drawerIsOpen: false));
    } else {
      emit(state.copyWith(action: OpenDrawer(), drawerIsOpen: true));
    }
  }

  FutureOr<void> _backClicked(BackClicked event, Emitter<NavigationState> emit) {
    if (state.drawerIsOpen) {
      emit(state.copyWith(action: null));
      emit(state.copyWith(action: CloseDrawer()));
    } else {
      if (Platform.isIOS) {
        emit(state.copyWith(action: NavigateAction.navigateBack()));
      } else {
        SystemNavigator.pop();
      }
    }
  }

  Future<void> _getActiveRent(Emitter<NavigationState> emit) async {}

  FutureOr<void> _rentCompleted(
    RentCompleted event,
    Emitter<NavigationState> emit,
  ) {
    emit(state.copyWith(action: null));
    emit(state.copyWith(action: ShowRentCompletedModal()));
  }

  FutureOr<void> _logout(Logout event, Emitter<NavigationState> emit) async {
    preferencesLocalGateway.setToken(null);
    String? pushToken = await preferencesLocalGateway.getPushToken();
    await preferencesLocalGateway.setBankCardId(null);
    if (pushToken != null) {
      notificationsRepository.removeNotificationsToken(pushToken);
    }
    await Locator.unregisterUser();
    emit(state.copyWith(action: NavigateAction.navigateToAuthorization(NavigateType.pushAndRemoveUntil)));
  }

  Future<FutureOr<void>> _exitClicked(
    ExitClicked event,
    Emitter<NavigationState> emit,
  ) async {
    emit(state.copyWith(action: null));
    emit(state.copyWith(action: ShowLogoutModal()));
  }

  FutureOr<void> _drawerStateChanged(DrawerStateChanged event, Emitter<NavigationState> emit) {
    emit(state.copyWith(drawerIsOpen: event.isOpen));
  }
}
