part of 'navigation_bloc.dart';

@freezed
class NavigationEvent with _$NavigationEvent {
  factory NavigationEvent.init() = Init;
  factory NavigationEvent.menuItemSelected(MenuItem item) = MenuItemSelected;
  factory NavigationEvent.menuClicked() = MenuClicked;
  factory NavigationEvent.rentCompleted() = RentCompleted;
  factory NavigationEvent.backClicked() = BackClicked;
  factory NavigationEvent.exitClicked() = ExitClicked;
  factory NavigationEvent.logout() = Logout;
  factory NavigationEvent.drawerStateChanged(bool isOpen) = DrawerStateChanged;
}
