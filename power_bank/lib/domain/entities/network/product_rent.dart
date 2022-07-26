import 'package:json_annotation/json_annotation.dart';
import 'package:power_bank/core/utils/date_time_json_formatter.dart';
import 'package:power_bank/domain/entities/network/product.dart';
import 'package:power_bank/domain/entities/network/tariff.dart';
import 'package:power_bank/domain/entities/network/user.dart';
import 'package:power_bank/domain/enums/postpaid_refund_status.dart';
import 'package:power_bank/domain/enums/product_rent_status.dart';

part 'product_rent.g.dart';

@JsonSerializable()
class ProductRent {
  ProductRent({
    required this.id,
    required this.status,
    this.createdAt,
    this.updatedAt,
    this.tariff,
    this.product,
    required this.user,
    this.startedAt,
    this.endedAt,
    this.postpaidAmount,
    required this.prepayAmount,
    this.statusPostpaidRefund,
    this.totalAmount,
    this.failReason,
  });

  @JsonKey(name: 'productRentId')
  int id;
  User user;
  Product? product;
  Tariff? tariff;
  @JsonKey(fromJson: DateTimeJsonFormatter.dateTimeFromEpochUs, toJson: DateTimeJsonFormatter.dateTimeToEpochUs)
  DateTime? startedAt;
  @JsonKey(fromJson: DateTimeJsonFormatter.dateTimeFromEpochUs, toJson: DateTimeJsonFormatter.dateTimeToEpochUs)
  DateTime? endedAt;
  @JsonKey(fromJson: ProductRentStatusExtension.fromValue, toJson: ProductRentStatusExtension.toValue)
  ProductRentStatus status;
  @JsonKey(fromJson: PostpaidRefundStatusExtension.fromValue, toJson: PostpaidRefundStatusExtension.toValue)
  PostpaidRefundStatus? statusPostpaidRefund;
  double prepayAmount;
  double? totalAmount;
  double? postpaidAmount;
  @JsonKey(fromJson: DateTimeJsonFormatter.dateTimeFromEpochUs, toJson: DateTimeJsonFormatter.dateTimeToEpochUs)
  DateTime? createdAt;
  @JsonKey(fromJson: DateTimeJsonFormatter.dateTimeFromEpochUs, toJson: DateTimeJsonFormatter.dateTimeToEpochUs)
  DateTime? updatedAt;
  String? failReason;

  factory ProductRent.fromJson(Map<String, dynamic> json) => _$ProductRentFromJson(json);

  Map<String, dynamic> toJson() => _$ProductRentToJson(this);
}
