part of 'navigation_bloc.dart';

@freezed
class NavigationState extends BaseBlocState with _$NavigationState {
  factory NavigationState({
    BlocAction? action,
    required Settings settings,
    required User user,
    @Default([
      MenuItem.paymentMethods,
      MenuItem.tariffs,
      MenuItem.support,
      MenuItem.aboutService,
    ])
        List<MenuItem> menuItems,
    @Default(true)
        bool isLoading,
    @Default(false)
        bool drawerIsOpen,
  }) = _NavigationState;
}

class OpenDrawer extends BlocAction {}

class CloseDrawer extends BlocAction {}

class ShowRentCompletedModal extends BlocAction {}

class ShowLogoutModal extends BlocAction {}
