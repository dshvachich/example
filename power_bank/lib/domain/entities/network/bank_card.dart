import 'package:json_annotation/json_annotation.dart';
import 'package:power_bank/core/utils/date_time_json_formatter.dart';
import 'package:power_bank/domain/enums/card_type.dart';

part 'bank_card.g.dart';

@JsonSerializable()
class BankCard {
  BankCard({
    required this.id,
    required this.cardNumber,
    required this.type,
    this.month,
    this.year,
    required this.bankInfo,
    required this.userId,
    this.createdAt,
    this.updatedAt,
  });

  @JsonKey(name: 'bankCardId')
  int id;
  String cardNumber;
  @JsonKey(fromJson: CardTypeExtension.fromValue, toJson: CardTypeExtension.toValue)
  CardType type;
  int? month;
  int? year;
  String bankInfo;
  @JsonKey(fromJson: DateTimeJsonFormatter.dateTimeFromEpochUs, toJson: DateTimeJsonFormatter.dateTimeToEpochUs)
  DateTime? createdAt;
  int userId;
  @JsonKey(fromJson: DateTimeJsonFormatter.dateTimeFromEpochUs, toJson: DateTimeJsonFormatter.dateTimeToEpochUs)
  DateTime? updatedAt;

  factory BankCard.fromJson(Map<String, dynamic> json) => _$BankCardFromJson(json);

  Map<String, dynamic> toJson() => _$BankCardToJson(this);
}
