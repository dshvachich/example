import 'package:json_annotation/json_annotation.dart';

import '../product_rent.dart';

part 'product_rent_response.g.dart';

@JsonSerializable()
class ProductRentResponse {
  ProductRentResponse({
    this.productRent,
  });

  ProductRent? productRent;

  factory ProductRentResponse.fromJson(Map<String, dynamic> json) => _$ProductRentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductRentResponseToJson(this);
}
