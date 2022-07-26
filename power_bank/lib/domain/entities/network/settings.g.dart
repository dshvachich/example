// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Settings _$SettingsFromJson(Map<String, dynamic> json) => Settings(
      supportUrl: json['supportUrl'] as String,
      holdMoney: json['holdMoney'] as int,
      contacts: json['contacts'] == null ? null : Contacts.fromJson(json['contacts'] as Map<String, dynamic>),
      pages: Pages.fromJson(json['pages'] as Map<String, dynamic>),
      appSupportEmail: json['appSupportEmail'] as String,
      appStoreUrl: json['appStoreUrl'] as String,
      googlePlayUrl: json['googlePlayUrl'] as String,
      limitRecordsOnPage: json['limitRecordsOnPage'] as int,
    );

Map<String, dynamic> _$SettingsToJson(Settings instance) => <String, dynamic>{
      'supportUrl': instance.supportUrl,
      'contacts': instance.contacts,
      'pages': instance.pages,
      'appSupportEmail': instance.appSupportEmail,
      'appStoreUrl': instance.appStoreUrl,
      'googlePlayUrl': instance.googlePlayUrl,
      'limitRecordsOnPage': instance.limitRecordsOnPage,
      'holdMoney': instance.holdMoney,
    };
