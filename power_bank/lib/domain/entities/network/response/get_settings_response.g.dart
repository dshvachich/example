// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_settings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSettingsResponse _$GetSettingsResponseFromJson(Map<String, dynamic> json) => GetSettingsResponse(
      appConfig: Settings.fromJson(json['appConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetSettingsResponseToJson(GetSettingsResponse instance) => <String, dynamic>{
      'appConfig': instance.appConfig,
    };
