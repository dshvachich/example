// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vending_machine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendingMachine _$VendingMachineFromJson(Map<String, dynamic> json) => VendingMachine(
      id: json['vendingMachineId'] as int,
      maxProductCount: json['maxProductCount'] as int,
      freePlacesCount: json['freePlacesCount'] as int,
      availableProductCount: json['availableProductCount'] as int,
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      tariff: (json['tariff'] as List<dynamic>).map((e) => Tariff.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$VendingMachineToJson(VendingMachine instance) => <String, dynamic>{
      'vendingMachineId': instance.id,
      'maxProductCount': instance.maxProductCount,
      'freePlacesCount': instance.freePlacesCount,
      'availableProductCount': instance.availableProductCount,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'tariff': instance.tariff,
    };
