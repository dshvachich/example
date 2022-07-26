import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static String getFormattedString(String string, List<String> inserts) {
    String newString = string;
    inserts.forEach((insert) {
      newString = newString.replaceFirst('{\$}', insert);
    });
    return newString;
  }

  late Map<String, String> _localizedStrings;

  Future<bool> load() async {
    String jsonString = await rootBundle.loadString('assets/i18n/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String get appTitle => _localizedStrings['appTitle'] ?? '';
  String get authorizationDescription => _localizedStrings['authorizationDescription'] ?? '';
  String get enterNumber => _localizedStrings['enterNumber'] ?? '';
  String get sendCode => _localizedStrings['sendCode'] ?? '';

  String get needFillPhoneNumber => _localizedStrings['needFillPhoneNumber'] ?? '';

  String get youEnteredIncorrectPhoneNumber => _localizedStrings['youEnteredIncorrectPhoneNumber'] ?? '';

  String get phoneMask => _localizedStrings['phoneMask'] ?? '';

  String get logIn => _localizedStrings['logIn'] ?? '';

  String get privacyPolicyAndTermsOfUseDescription => _localizedStrings['privacyPolicyAndTermsOfUseDescription'] ?? '';

  String get privacyPolicy => _localizedStrings['privacyPolicy'] ?? '';

  String get and => _localizedStrings['and'] ?? '';

  String get termsOfUse => _localizedStrings['termsOfUse'] ?? '';

  String get error => _localizedStrings['error'] ?? '';

  String get noNetworkConnection => _localizedStrings['noNetworkConnection'] ?? '';

  String get repeat => _localizedStrings['repeat'] ?? '';

  String get authorizationCode => _localizedStrings['authorizationCode'] ?? '';

  String get enter => _localizedStrings['enter'] ?? '';

  String get enterConfirmationCode => _localizedStrings['enterConfirmationCode'] ?? '';

  String smsWasSentToTheNumber(String number) => getFormattedString(
        _localizedStrings['smsWasSentToTheNumber'] ?? '',
        [number],
      );

  String afterSecond(String seconds) => getFormattedString(
        _localizedStrings['afterSecond'] ?? '',
        [seconds],
      );

  String get youCan => _localizedStrings['youCan'] ?? '';

  String get resendCode => _localizedStrings['resendCode'] ?? '';

  String get somethingWentWrong => _localizedStrings['somethingWentWrong'] ?? '';

  String get findPowerBank => _localizedStrings['findPowerBank'] ?? '';

  String get rentPowerBank => _localizedStrings['rentPowerBank'] ?? '';

  String get myCards => _localizedStrings['myCards'] ?? '';

  String get tariffs => _localizedStrings['tariffs'] ?? '';

  String get contacts => _localizedStrings['contacts'] ?? '';

  String get aboutService => _localizedStrings['aboutService'] ?? '';

  String get cooperation => _localizedStrings['cooperation'] ?? '';

  String get exit => _localizedStrings['exit'] ?? '';

  String get vendingMachinesOnMap => _localizedStrings['vendingMachinesOnMap'] ?? '';

  String get rentPowerBankTimer => _localizedStrings['rentPowerBankTimer'] ?? '';

  String get returnPowerBank => _localizedStrings['returnPowerBank'] ?? '';

  String get select => _localizedStrings['select'] ?? '';

  String get attachCard => _localizedStrings['attachCard'] ?? '';

  String get payOtherCard => _localizedStrings['payOtherCard'] ?? '';

  String get noAttachedCardsDescription => _localizedStrings['noAttachedCardsDescription'] ?? '';

  String get informationAboutVendingMachine => _localizedStrings['informationAboutVendingMachine'] ?? '';

  String get scanQrCode => _localizedStrings['scanQrCode'] ?? '';

  String get findVendingMachineOnMap => _localizedStrings['findVendingMachineOnMap'] ?? '';

  String get availablePowerBanks => _localizedStrings['availablePowerBanks'] ?? '';

  String get freeSlots => _localizedStrings['freeSlots'] ?? '';
  String get selectCard => _localizedStrings['selectCard'] ?? '';

  String get contactData => _localizedStrings['contactData'] ?? '';
  String get address => _localizedStrings['address'] ?? '';
  String get phones => _localizedStrings['phones'] ?? '';
  String get questionsWriteToUs => _localizedStrings['questionsWriteToUs'] ?? '';
  String get topic => _localizedStrings['topic'] ?? '';
  String get email => _localizedStrings['email'] ?? '';
  String get message => _localizedStrings['message'] ?? '';
  String get send => _localizedStrings['send'] ?? '';
  String get notIndicated => _localizedStrings['notIndicated'] ?? '';
  String get notListed => _localizedStrings['notListed'] ?? '';
  String get youMustSpecifyTopic => _localizedStrings['youMustSpecifyTopic'] ?? '';
  String get youMustSpecifyEmail => _localizedStrings['youMustSpecifyEmail'] ?? '';
  String get needWriteMessage => _localizedStrings['needWriteMessage'] ?? '';
  String get feedbackSent => _localizedStrings['feedbackSent'] ?? '';
  String get rentTimerDescription => _localizedStrings['rentTimerDescription'] ?? '';
  String get putThePowerBankInAnOpenCell => _localizedStrings['putThePowerBankInAnOpenCell'] ?? '';
  String get understand => _localizedStrings['understand'] ?? '';
  String get powerBankRentCompleted => _localizedStrings['powerBankRentCompleted'] ?? '';
  String get continueText => _localizedStrings['continueText'] ?? '';
  String get noCameraAccess => _localizedStrings['noCameraAccess'] ?? '';
  String get cantGetGeoPermission => _localizedStrings['cantGetGeoPermission'] ?? '';
  String get checkYourGeoSettings => _localizedStrings['checkYourGeoSettings'] ?? '';
  String get enterCode => _localizedStrings['enterCode'] ?? '';
  String get toExit => _localizedStrings['toExit'] ?? '';
  String get madeByBravery => _localizedStrings['madeByBravery'] ?? '';
  String get version => _localizedStrings['version'] ?? '';
  String get paymentMethods => _localizedStrings['paymentMethods'] ?? '';
  String get support => _localizedStrings['support'] ?? '';
  String get vendingMachineGetPower => _localizedStrings['vendingMachineGetPower'] ?? '';
  String resendCodeAfter(String duration) => getFormattedString(
        _localizedStrings['resendCodeAfter'] ?? '',
        [duration],
      );
  String get canBeTaken => _localizedStrings['сanBeTaken'] ?? '';
  String get canBeHandedOver => _localizedStrings['canBeHandedOver'] ?? '';
  String get rent => _localizedStrings['rent'] ?? '';
  String get chooseAnotherOption => _localizedStrings['chooseAnotherOption'] ?? '';
  String get scanQrCodeDescription => _localizedStrings['scanQrCodeDescription'] ?? '';

  String get supportService => _localizedStrings['supportService'] ?? '';
  String get supportServiceDescription => _localizedStrings['supportServiceDescription'] ?? '';
  String get sendMessage => _localizedStrings['sendMessage'] ?? '';

  String get logoutDescription => _localizedStrings['logoutDescription'] ?? '';
  String get yesExit => _localizedStrings['yesExit'] ?? '';
  String get noStay => _localizedStrings['noStay'] ?? '';
  String get successfullySent => _localizedStrings['successfullySent'] ?? '';
  String get feedBackDescription => _localizedStrings['feedBackDescription'] ?? '';
  String get great => _localizedStrings['great'] ?? '';
  String get youRentAPowerBank => _localizedStrings['youRentAPowerBank'] ?? '';
  String get placeOfCommencementOfTheLease => _localizedStrings['placeOfCommencementOfTheLease'] ?? '';
  String get rentalStartDateAndTime => _localizedStrings['rentalStartDateAndTime'] ?? '';
  String get afterCharging => _localizedStrings['afterCharging'] ?? '';
  String get handOverPowerbank => _localizedStrings['handOverPowerbank'] ?? '';
  String get tariff => _localizedStrings['tariff'] ?? '';
  String get cost => _localizedStrings['cost'] ?? '';
  String get day => _localizedStrings['day'] ?? '';
  String get afterChargingDescription => _localizedStrings['afterChargingDescription'] ?? '';
  String get takePowerbank => _localizedStrings['takePowerbank'] ?? '';
  String get rentCompleted => _localizedStrings['rentCompleted'] ?? '';
  String get site => _localizedStrings['site'] ?? '';
  String get phone => _localizedStrings['phone'] ?? '';
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['ru', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = new AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
