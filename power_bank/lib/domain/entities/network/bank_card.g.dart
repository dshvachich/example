// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankCard _$BankCardFromJson(Map<String, dynamic> json) => BankCard(
      id: json['bankCardId'] as int,
      cardNumber: json['cardNumber'] as String,
      type: CardTypeExtension.fromValue(json['type'] as int),
      month: json['month'] as int?,
      year: json['year'] as int?,
      bankInfo: json['bankInfo'] as String,
      userId: json['userId'] as int,
      createdAt: DateTimeJsonFormatter.dateTimeFromEpochUs(json['createdAt'] as int?),
      updatedAt: DateTimeJsonFormatter.dateTimeFromEpochUs(json['updatedAt'] as int?),
    );

Map<String, dynamic> _$BankCardToJson(BankCard instance) => <String, dynamic>{
      'bankCardId': instance.id,
      'cardNumber': instance.cardNumber,
      'type': CardTypeExtension.toValue(instance.type),
      'month': instance.month,
      'year': instance.year,
      'bankInfo': instance.bankInfo,
      'createdAt': DateTimeJsonFormatter.dateTimeToEpochUs(instance.createdAt),
      'userId': instance.userId,
      'updatedAt': DateTimeJsonFormatter.dateTimeToEpochUs(instance.updatedAt),
    };
