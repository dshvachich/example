import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:power_bank/app/bloc/app_bloc.dart';
import 'package:power_bank/data/gateways/remote/bank_cards_remote_gateway.dart';
import 'package:power_bank/data/gateways/remote/contacts_remote_gateway.dart';
import 'package:power_bank/data/gateways/remote/notifications_remote_gateway.dart';
import 'package:power_bank/data/gateways/remote/product_rent_remote_gateway.dart';
import 'package:power_bank/data/gateways/remote/settings_remote_gateway.dart';
import 'package:power_bank/data/gateways/remote/user_remote_gateway.dart';
import 'package:power_bank/data/gateways/remote/vending_machines_remote_gateway.dart';
import 'package:power_bank/data/repositories/bank_cards_repository.dart';
import 'package:power_bank/data/repositories/contacts_repository.dart';
import 'package:power_bank/data/repositories/notifications_repository.dart';
import 'package:power_bank/data/repositories/product_rent_repository.dart';
import 'package:power_bank/data/repositories/settings_repository.dart';
import 'package:power_bank/data/repositories/user_repository.dart';
import 'package:power_bank/data/repositories/vending_machines_repository.dart';
import 'package:power_bank/domain/entities/network/settings.dart';
import 'package:power_bank/domain/entities/network/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/network/dio_helper.dart';
import '../core/network/network_info.dart';
import '../data/gateways/local/preferences_local_gateway.dart';
import '../data/gateways/remote/authorization_remote_gateway.dart';
import '../data/repositories/authorization_repository.dart';
import '../data/web_socket_manager.dart';
import '../localization/app_localizations.dart';

class Locator {
  static GetIt injection = GetIt.I;

  static Future<void> registerSettings(Settings settings) async {
    injection.registerSingleton<Settings>(settings);
  }

  static Future<void> registerLocalization(BuildContext context) async {
    injection.registerSingleton<AppLocalizations>(AppLocalizations.of(context));
  }

  static Future<void> registerAppBloc(AppBloc appBloc) async {
    injection.registerSingleton<AppBloc>(appBloc);
  }

  static Future<void> registerUser(User user) async {
    injection.registerSingleton<User>(user);
  }

  static Future<void> unregisterUser() async {
    injection.unregister<User>();
  }

  static Future<void> init() async {
    injection.registerSingleton<FlutterSecureStorage>(FlutterSecureStorage());
    injection.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());
    injection.registerSingleton<PreferencesLocalGateway>(
      PreferencesLocalGateway(flutterSecureStorage: injection(), sharedPreferences: injection()),
    );
    injection.registerSingleton<Dio>(DioHelper.getDio(
      preferencesLocalGateway: injection(),
    ));

    injection.registerSingleton<DataConnectionChecker>(DataConnectionChecker());
    injection.registerSingleton<NetworkInfo>(NetworkInfoImpl(injection()));

    injection.registerSingleton<AuthorizationRemoteGateway>(AuthorizationRemoteGateway(dio: DioHelper.getAuthDio()));

    injection.registerLazySingleton<AuthorizationRepository>(() => AuthorizationRepository(
          injection(),
          gateway: injection(),
        ));

    injection.registerSingleton<SettingsRemoteGateway>(SettingsRemoteGateway(dio: injection()));

    injection.registerLazySingleton<SettingsRepository>(() => SettingsRepository(
          injection(),
          gateway: injection(),
        ));

    injection.registerSingleton<NotificationsRemoteGateway>(NotificationsRemoteGateway(dio: injection()));

    injection.registerLazySingleton<NotificationsRepository>(() => NotificationsRepository(
          injection(),
          gateway: injection(),
        ));

    injection.registerSingleton<VendingMachinesRemoteGateway>(VendingMachinesRemoteGateway(dio: injection()));

    injection.registerLazySingleton<VendingMachinesRepository>(() => VendingMachinesRepository(
          injection(),
          gateway: injection(),
        ));

    injection.registerSingleton<ProductRentRemoteGateway>(ProductRentRemoteGateway(dio: injection()));

    injection.registerLazySingleton<ProductRentRepository>(() => ProductRentRepository(
          injection(),
          gateway: injection(),
        ));

    injection.registerSingleton<BankCardsRemoteGateway>(BankCardsRemoteGateway(dio: injection()));

    injection.registerLazySingleton<BankCardsRepository>(() => BankCardsRepository(
          injection(),
          gateway: injection(),
        ));

    injection.registerSingleton<ContactsRemoteGateway>(ContactsRemoteGateway(dio: injection()));

    injection.registerLazySingleton<ContactsRepository>(() => ContactsRepository(
          injection(),
          gateway: injection(),
        ));

    injection.registerLazySingleton<WebSocketManager>(() => WebSocketManager(
          networkInfo: injection(),
          preferencesLocalGateway: injection(),
        ));

    injection.registerSingleton<UserRemoteGateway>(UserRemoteGateway(dio: injection()));

    injection.registerLazySingleton<UserRepository>(() => UserRepository(
          injection(),
          gateway: injection(),
        ));

    AppBloc appBloc = AppBloc(
      socketManager: Locator.injection(),
      notificationsRepository: Locator.injection(),
      preferencesLocalGateway: Locator.injection(),
    );
  }
}
