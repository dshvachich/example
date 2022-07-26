// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_rent_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductRentResponse _$ProductRentResponseFromJson(Map<String, dynamic> json) => ProductRentResponse(
      productRent:
          json['productRent'] == null ? null : ProductRent.fromJson(json['productRent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductRentResponseToJson(ProductRentResponse instance) => <String, dynamic>{
      'productRent': instance.productRent,
    };
