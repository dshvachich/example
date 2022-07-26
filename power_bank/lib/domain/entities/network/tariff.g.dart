// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tariff.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tariff _$TariffFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Tariff',
      json,
      ($checkedConvert) {
        final val = Tariff(
          tariffId: $checkedConvert('tariffId', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          status: $checkedConvert('status', (v) => v as int),
          validityPeriod: $checkedConvert('validityPeriod', (v) => v),
          price: $checkedConvert('price', (v) => v),
        );
        return val;
      },
    );

Map<String, dynamic> _$TariffToJson(Tariff instance) => <String, dynamic>{
      'tariffId': instance.tariffId,
      'name': instance.name,
      'description': instance.description,
      'status': instance.status,
      'validityPeriod': instance.validityPeriod,
      'price': instance.price,
    };
