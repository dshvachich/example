import 'package:json_annotation/json_annotation.dart';
import 'package:power_bank/domain/entities/network/contacts.dart';
import 'package:power_bank/domain/entities/network/pages.dart';

part 'settings.g.dart';

@JsonSerializable()
class Settings {
  Settings({
    required this.supportUrl,
    required this.holdMoney,
    this.contacts,
    required this.pages,
    required this.appSupportEmail,
    required this.appStoreUrl,
    required this.googlePlayUrl,
    required this.limitRecordsOnPage,
  });

  final String supportUrl;
  final Contacts? contacts;
  final Pages pages;
  final String appSupportEmail;
  final String appStoreUrl;
  final String googlePlayUrl;
  final int limitRecordsOnPage;
  final int holdMoney;

  factory Settings.fromJson(Map<String, dynamic> json) => _$SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsToJson(this);
}
