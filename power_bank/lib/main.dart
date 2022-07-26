import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_bank/app/bloc/app_bloc.dart';

import 'app/app.dart';
import 'app/resources/app_styles.dart';
import 'di/injection.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(AppStyles.startStyle);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  WidgetsFlutterBinding.ensureInitialized();
  await Locator.init();
  AppBloc appBloc = AppBloc(
    socketManager: Locator.injection(),
    notificationsRepository: Locator.injection(),
    preferencesLocalGateway: Locator.injection(),
  );
  await Locator.registerAppBloc(appBloc);
  runZonedGuarded(() {
    runApp(
      BlocProvider(
        create: (context) => appBloc,
        child: App(),
      ),
    );
  }, (error, stackTrace) {
    print('runZonedGuarded: Caught error in my root zone.\n $error $stackTrace');
  });
}
