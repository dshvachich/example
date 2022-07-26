// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_by_phone_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginByPhoneResponse _$LoginByPhoneResponseFromJson(Map<String, dynamic> json) => LoginByPhoneResponse(
      accessToken: json['accessToken'] as String,
      isAlreadyRegistered: json['isAlreadyRegistered'] as int,
    );

Map<String, dynamic> _$LoginByPhoneResponseToJson(LoginByPhoneResponse instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'isAlreadyRegistered': instance.isAlreadyRegistered,
    };
