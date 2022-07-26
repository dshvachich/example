// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_tariffs_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTariffsResponse _$GetTariffsResponseFromJson(Map<String, dynamic> json) => GetTariffsResponse(
      tariffs: (json['tariffs'] as List<dynamic>).map((e) => Tariff.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$GetTariffsResponseToJson(GetTariffsResponse instance) => <String, dynamic>{
      'tariffs': instance.tariffs,
    };
