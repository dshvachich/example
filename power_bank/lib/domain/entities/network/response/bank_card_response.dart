import 'package:json_annotation/json_annotation.dart';
import 'package:power_bank/domain/entities/network/bank_card.dart';

part 'bank_card_response.g.dart';

@JsonSerializable()
class BankCardResponse {
  BankCardResponse({
    required this.card,
  });

  final BankCard card;

  factory BankCardResponse.fromJson(Map<String, dynamic> json) => _$BankCardResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BankCardResponseToJson(this);
}
