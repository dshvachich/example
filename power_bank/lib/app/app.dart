import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:power_bank/app/bloc/app_bloc.dart';
import 'package:power_bank/app/presentation/screens/start/bloc/start_bloc.dart';
import 'package:power_bank/app/presentation/screens/start/start_screen.dart';
import 'package:power_bank/app/resources/app_themes.dart';
import 'package:power_bank/core/ui/widgets/base_bloc_state_widget.dart';
import 'package:power_bank/core/ui/widgets/close_keyboard_by_tap.dart';
import 'package:power_bank/di/injection.dart';
import 'package:power_bank/localization/app_localizations.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends BaseBlocStateWidget<App, AppBloc, AppEvent> with WidgetsBindingObserver {
  late KeyboardVisibilityNotification _keyboardListener;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    _keyboardListener = KeyboardVisibilityNotification();
    _keyboardListener.addNewListener(onChange: (bool visible) {
      if (!visible) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    sendEvent(AppEvent.appLifecycleStateChanged(state));
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance?.removeObserver(this);
    _keyboardListener.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<AppBloc, AppState>(
        buildWhen: (previous, current) => previous.locale != current.locale,
        builder: (context, state) => CloseKeyboardByTap(
          OverlaySupport(
            child: MaterialApp(
              navigatorKey: navigatorKey,
              theme: AppThemes.appTheme,
              locale: state.locale,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: <LocalizationsDelegate<dynamic>>[
                AppLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: [
                Locale('ru'),
                Locale('en'),
              ],
              home: BlocProvider(
                create: (BuildContext context) => StartBloc(
                  preferencesLocalGateway: Locator.injection(),
                  settingsRepository: Locator.injection(),
                  productRentRepository: Locator.injection(),
                  userRepository: Locator.injection(),
                ),
                child: StartScreen(),
              ),
            ),
          ),
        ),
      );
}
