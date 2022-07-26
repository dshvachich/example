// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_cards_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankCardsResponse _$BankCardsResponseFromJson(Map<String, dynamic> json) => BankCardsResponse(
      bankCards: (json['bankCards'] as List<dynamic>).map((e) => BankCard.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$BankCardsResponseToJson(BankCardsResponse instance) => <String, dynamic>{
      'bankCards': instance.bankCards,
    };
