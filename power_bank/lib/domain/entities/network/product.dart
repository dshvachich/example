import 'package:json_annotation/json_annotation.dart';
import 'package:power_bank/core/utils/date_time_json_formatter.dart';
import 'package:power_bank/domain/entities/network/vending_machine.dart';

part 'product.g.dart';

class ProductStatus {
  const ProductStatus._(this.value);

  final int value;

  static final ProductStatus defaultStatus = ProductStatus._(0);
  static final ProductStatus deleted = ProductStatus._(1);
  static final ProductStatus taken = ProductStatus._(2);
  static final ProductStatus broken = ProductStatus._(3);

  static ProductStatus fromValue(int value) => ProductStatus._(value);

  static int toValue(ProductStatus productRentStatus) => productRentStatus.value;
}

@JsonSerializable()
class Product {
  Product({
    required this.id,
    this.vendingMachine,
    required this.status,
    this.updatedAt,
    this.createdAt,
    required this.serialNumber,
  });

  @JsonKey(name: 'productId')
  int id;
  VendingMachine? vendingMachine;
  @JsonKey(fromJson: ProductStatus.fromValue, toJson: ProductStatus.toValue)
  ProductStatus status;
  String serialNumber;
  @JsonKey(fromJson: DateTimeJsonFormatter.dateTimeFromEpochUs, toJson: DateTimeJsonFormatter.dateTimeToEpochUs)
  DateTime? createdAt;
  @JsonKey(fromJson: DateTimeJsonFormatter.dateTimeFromEpochUs, toJson: DateTimeJsonFormatter.dateTimeToEpochUs)
  DateTime? updatedAt;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
