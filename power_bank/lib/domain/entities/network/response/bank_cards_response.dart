import 'package:json_annotation/json_annotation.dart';
import 'package:power_bank/domain/entities/network/bank_card.dart';

part 'bank_cards_response.g.dart';

@JsonSerializable()
class BankCardsResponse {
  BankCardsResponse({
    required this.bankCards,
  });

  final List<BankCard> bankCards;

  factory BankCardsResponse.fromJson(Map<String, dynamic> json) => _$BankCardsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BankCardsResponseToJson(this);
}
