import 'dart:math';

import 'package:libphonenumber_platform_interface/libphonenumber_platform_interface.dart';
import 'package:libphonenumber_plugin/libphonenumber_plugin.dart';

/// [PhoneNumber] contains detailed information about a phone number
class PhoneNumber {
  /// Either formatted or unformatted String of the phone number
  final String phoneNumber;

  /// The Country [dialCode] of the phone number
  final String dialCode;

  /// Country [isoCode] of the phone number
  final String isoCode;

  /// [_hash] is used to compare instances of [PhoneNumber] object.
  final int _hash;

  /// Returns an integer generated after the object was initialised.
  /// Used to compare different instances of [PhoneNumber]
  int get hash => _hash;

  Future<bool?> get isValid => PhoneNumberUtil.isValidPhoneNumber(phoneNumber, isoCode);

  PhoneNumber({
    required this.phoneNumber,
    required this.dialCode,
    required this.formattedNumber,
    required this.isoCode,
  }) : _hash = 1000 + Random().nextInt(99999 - 1000);

  String formattedNumber;

  String getRawNumber() {
    return phoneNumber;
  }

  Future<String?> getFormattedNumber({String? isoCode}) async {
    // return await PhoneNumberUtil.formatAsYouType(
    //   phoneNumber,
    //   isoCode ?? this.isoCode,
    // );

    return formattedNumber;
  }

  /// Returns [PhoneNumberType] which is the type of phone number
  /// Accepts [phoneNumber] and [isoCode] and r
  static Future<PhoneNumberType> getPhoneNumberType(String phoneNumber, String isoCode) async {
    PhoneNumberType type = await PhoneNumberUtil.getNumberType(phoneNumber, isoCode);

    return type;
  }
}
