import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesLocalGateway {
  PreferencesLocalGateway({
    required this.flutterSecureStorage,
    required this.sharedPreferences,
  });

  static const tokenKey = 'token';
  static const pushTokenKey = 'pushToken';

  static const localeKey = 'locale';
  static const phoneKey = 'phone';
  static const bankCardIdKey = 'bankCardId';
  static const formattedPhoneKey = 'formattedPhone';

  FlutterSecureStorage flutterSecureStorage;
  SharedPreferences sharedPreferences;

  Future<String?> getToken() async {
    //return '5RWwREk7rMITn-wGB2uChUAmYN70ovXO';
    String? token = await flutterSecureStorage.read(key: tokenKey);
    return token;

    if (token == null) {
      return null;
    } else {
      return token;
    }
  }

  Future setToken(String? apiToken) {
    return flutterSecureStorage.write(key: tokenKey, value: apiToken);
  }

  Future<String?> getPushToken() async {
    String? token = await flutterSecureStorage.read(key: pushTokenKey);
    return token;
  }

  Future<int?> getBankCardId() async {
    String? id = await flutterSecureStorage.read(key: bankCardIdKey);
    return id != null ? int.tryParse(id) : null;
  }

  Future setBankCardId(int? id) {
    return flutterSecureStorage.write(key: bankCardIdKey, value: id.toString());
  }

  Future setPushToken(String? token) {
    return flutterSecureStorage.write(key: pushTokenKey, value: token);
  }

  Future<String?> getPhone() async {
    return flutterSecureStorage.read(key: phoneKey);
  }

  Future setPhone(String? phone) {
    return flutterSecureStorage.write(key: phoneKey, value: phone);
  }

  Future<String?> getPhoneFormatted() async {
    return flutterSecureStorage.read(key: formattedPhoneKey);
  }

  Future setPhoneFormatted(String? apiToken) {
    return flutterSecureStorage.write(key: formattedPhoneKey, value: apiToken);
  }

  Future<String?> getLocale() async {
    return await flutterSecureStorage.read(key: localeKey);
  }

  Future setLocale(String? locale) {
    return flutterSecureStorage.write(key: localeKey, value: locale);
  }
}
