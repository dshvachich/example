// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['productId'] as int,
      vendingMachine: json['vendingMachine'] == null
          ? null
          : VendingMachine.fromJson(json['vendingMachine'] as Map<String, dynamic>),
      status: ProductStatus.fromValue(json['status'] as int),
      updatedAt: DateTimeJsonFormatter.dateTimeFromEpochUs(json['updatedAt'] as int?),
      createdAt: DateTimeJsonFormatter.dateTimeFromEpochUs(json['createdAt'] as int?),
      serialNumber: json['serialNumber'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productId': instance.id,
      'vendingMachine': instance.vendingMachine,
      'status': ProductStatus.toValue(instance.status),
      'serialNumber': instance.serialNumber,
      'createdAt': DateTimeJsonFormatter.dateTimeToEpochUs(instance.createdAt),
      'updatedAt': DateTimeJsonFormatter.dateTimeToEpochUs(instance.updatedAt),
    };
