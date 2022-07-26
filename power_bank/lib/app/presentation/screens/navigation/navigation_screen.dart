import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_bank/app/presentation/modals/message_modal.dart';
import 'package:power_bank/app/presentation/screens/vending_machines_on_map/bloc/vending_machines_on_map_bloc.dart';
import 'package:power_bank/app/presentation/screens/vending_machines_on_map/vending_machines_on_map_screen.dart';
import 'package:power_bank/app/widgets/drawers/navigation_drawer.dart';
import 'package:power_bank/core/ui/widgets/base_bloc_listener.dart';
import 'package:power_bank/core/ui/widgets/base_bloc_state_widget.dart';
import 'package:power_bank/di/injection.dart';
import 'package:power_bank/domain/enums/menu_item.dart' as enums;

import 'bloc/navigation_bloc.dart';

class NavigationScreen extends StatefulWidget {
  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends BaseBlocStateWidget<NavigationScreen, NavigationBloc, NavigationEvent> {
  GlobalKey<ScaffoldState>? _scaffoldKey;

  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        onDrawerChanged: (bool isOpen) {
          sendEvent(NavigationEvent.drawerStateChanged(isOpen));
        },
        key: _scaffoldKey,
        drawer: _buildDrawer(),
        body: _buildBody(),
      );

  Widget _buildDrawer() => BlocBuilder<NavigationBloc, NavigationState>(
        buildWhen: (previous, current) =>
            previous.menuItems != current.menuItems || previous.user.formattedPhone != current.user.formattedPhone,
        builder: (context, state) => NavigationDrawer(
          menuItems: state.menuItems,
          phone: state.user.formattedPhone,
          exitPressed: () {
            sendEvent(NavigationEvent.exitClicked());
          },
          menuItemPressed: (enums.MenuItem item) {
            sendEvent(NavigationEvent.menuItemSelected(item));
          },
        ),
      );

  Widget _buildBody() => BaseBlocListener<NavigationBloc, NavigationState>(
        listener: (context, state, action) async {
          if (action is OpenDrawer) {
            _scaffoldKey?.currentState?.openDrawer();
          }
          if (action is CloseDrawer) {
            _scaffoldKey?.currentState?.openEndDrawer();
          }
          if (action is ShowLogoutModal) {
            _showLogoutModal(context, action);
          }
        },
        child: WillPopScope(
          onWillPop: () async {
            sendEvent(NavigationEvent.backClicked());
            return false;
          },
          child: _buildMap(),
        ),
      );

  Widget _buildMap() => BlocProvider(
        create: (context) => VendingMachinesOnMapBloc(
          vendingMachinesRepository: Locator.injection(),
          productRentRepository: Locator.injection(),
          localization: Locator.injection(),
          notificationsRepository: Locator.injection(),
          preferencesLocalGateway: Locator.injection(),
          webSocketManager: Locator.injection(),
          appBloc: Locator.injection(),
        ),
        child: VendingMachinesOnMapScreen(),
      );

  Future<void> _showLogoutModal(BuildContext context, ShowLogoutModal action) => showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => MessageModal(
          title: localization.exit,
          text: localization.logoutDescription,
          mainButtonText: localization.noStay,
          additionalButtonText: localization.yesExit,
          onAdditionalButtonPressed: () {
            sendEvent(NavigationEvent.logout());
          },
        ),
      );

  @override
  void dispose() {
    _scaffoldKey = null;
    super.dispose();
  }
}
