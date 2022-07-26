import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_bank/app/presentation/screens/authorization/authorization_screen.dart';
import 'package:power_bank/app/presentation/screens/authorization/bloc/authorization_bloc.dart';
import 'package:power_bank/app/presentation/screens/confirm_phone/bloc/confirm_phone_bloc.dart';
import 'package:power_bank/app/presentation/screens/confirm_phone/confirm_phone_screen.dart';
import 'package:power_bank/app/presentation/screens/navigation/bloc/navigation_bloc.dart';
import 'package:power_bank/app/presentation/screens/navigation/navigation_screen.dart';
import 'package:power_bank/app/presentation/screens/start/bloc/start_bloc.dart';
import 'package:power_bank/app/presentation/screens/start/start_screen.dart';
import 'package:power_bank/app/presentation/screens/vending_machines_on_map/bloc/vending_machines_on_map_bloc.dart';
import 'package:power_bank/app/presentation/screens/vending_machines_on_map/vending_machines_on_map_screen.dart';
import 'package:power_bank/core/entities/phone_number.dart';
import 'package:power_bank/core/ui/widgets/page_route_without_animation.dart';
import 'package:power_bank/di/injection.dart';
import 'package:power_bank/domain/entities/network/settings.dart';
import 'package:power_bank/domain/entities/network/user.dart';

import 'navigate_action.dart';
import 'navigation_type.dart';

class AppNavigator {
  static Future<D?> navigate<D>({
    required BuildContext context,
    required NavigateAction action,
  }) async {
    if (action is NavigateBack) {
      Navigator.pop(context);
      return null;
    }

    late NavigateType navigateType;
    late Route<D?> route;
    String routeName = action.runtimeType.toString();
    action.when(
      navigateBack: () {},
      navigateToAuthorization: (NavigateType type) {
        navigateType = type;
        route = MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (BuildContext context) => BlocProvider(
            create: (context) => AuthorizationBloc(
              authorizationRepository: Locator.injection(),
              settings: Locator.injection(),
              localization: Locator.injection(),
            ),
            child: AuthorizationScreen(),
          ),
        );
      },
      navigateToStart: (NavigateType type) {
        navigateType = type;
        route = PageRouteWithoutAnimation(
          settings: RouteSettings(name: routeName),
          builder: (BuildContext context) => BlocProvider(
            create: (context) => StartBloc(
              preferencesLocalGateway: Locator.injection(),
              settingsRepository: Locator.injection(),
              productRentRepository: Locator.injection(),
              userRepository: Locator.injection(),
            ),
            child: StartScreen(),
          ),
        );
      },
      navigateToConfirmPhone: (NavigateType type, PhoneNumber phone) {
        navigateType = type;
        route = MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (BuildContext context) => BlocProvider(
            create: (context) => ConfirmPhoneBloc(
              phone: phone,
              authorizationRepository: Locator.injection(),
              localization: Locator.injection(),
              preferencesLocalGateway: Locator.injection(),
              userRepository: Locator.injection(),
            ),
            child: ConfirmPhoneScreen(),
          ),
        );
      },
      navigateToNavigation: (NavigateType type, Settings settings, User user) {
        navigateType = type;
        route = MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (BuildContext context) => BlocProvider(
            create: (context) => NavigationBloc(
              settings: settings,
              user: user,
              productRentRepository: Locator.injection(),
              localization: Locator.injection(),
              socketManager: Locator.injection(),
              preferencesLocalGateway: Locator.injection(),
              // firebaseMessaging: Locator.injection(),
              notificationsRepository: Locator.injection(),
            ),
            child: NavigationScreen(),
          ),
        );
      },
      navigateToVendingMachinesOnMap: (NavigateType type, bool isDrawerScreen) {
        navigateType = type;
        route = MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (BuildContext context) => BlocProvider(
            create: (context) => VendingMachinesOnMapBloc(
              vendingMachinesRepository: Locator.injection(),
              productRentRepository: Locator.injection(),
              localization: Locator.injection(),
              preferencesLocalGateway: Locator.injection(),
              notificationsRepository: Locator.injection(),
              webSocketManager: Locator.injection(),
              appBloc: Locator.injection(),
            ),
            child: VendingMachinesOnMapScreen(),
          ),
        );
      },
    );
    switch (navigateType) {
      case NavigateType.push:
        return await Navigator.push<D?>(context, route);
      case NavigateType.pushReplacement:
        return await Navigator.pushReplacement<D?, Object>(context, route);
      case NavigateType.pushAndRemoveUntil:
        return await Navigator.pushAndRemoveUntil<D?>(context, route, (_) => false);
      case NavigateType.popUntil:
        Navigator.popUntil(context, (routeForCompare) => route == routeForCompare);
    }
    return null;
  }
}
