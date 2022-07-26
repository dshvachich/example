// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_card_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankCardResponse _$BankCardResponseFromJson(Map<String, dynamic> json) => BankCardResponse(
      card: BankCard.fromJson(json['card'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BankCardResponseToJson(BankCardResponse instance) => <String, dynamic>{
      'card': instance.card,
    };
