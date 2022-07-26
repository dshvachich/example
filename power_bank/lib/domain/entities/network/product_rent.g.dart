// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_rent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductRent _$ProductRentFromJson(Map<String, dynamic> json) => ProductRent(
      id: json['productRentId'] as int,
      status: ProductRentStatusExtension.fromValue(json['status'] as int),
      createdAt: DateTimeJsonFormatter.dateTimeFromEpochUs(json['createdAt'] as int?),
      updatedAt: DateTimeJsonFormatter.dateTimeFromEpochUs(json['updatedAt'] as int?),
      tariff: json['tariff'] == null ? null : Tariff.fromJson(json['tariff'] as Map<String, dynamic>),
      product: json['product'] == null ? null : Product.fromJson(json['product'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      startedAt: DateTimeJsonFormatter.dateTimeFromEpochUs(json['startedAt'] as int?),
      endedAt: DateTimeJsonFormatter.dateTimeFromEpochUs(json['endedAt'] as int?),
      postpaidAmount: (json['postpaidAmount'] as num?)?.toDouble(),
      prepayAmount: (json['prepayAmount'] as num).toDouble(),
      statusPostpaidRefund: PostpaidRefundStatusExtension.fromValue(json['statusPostpaidRefund'] as int?),
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      failReason: json['failReason'] as String?,
    );

Map<String, dynamic> _$ProductRentToJson(ProductRent instance) => <String, dynamic>{
      'productRentId': instance.id,
      'user': instance.user,
      'product': instance.product,
      'tariff': instance.tariff,
      'startedAt': DateTimeJsonFormatter.dateTimeToEpochUs(instance.startedAt),
      'endedAt': DateTimeJsonFormatter.dateTimeToEpochUs(instance.endedAt),
      'status': ProductRentStatusExtension.toValue(instance.status),
      'statusPostpaidRefund': PostpaidRefundStatusExtension.toValue(instance.statusPostpaidRefund),
      'prepayAmount': instance.prepayAmount,
      'totalAmount': instance.totalAmount,
      'postpaidAmount': instance.postpaidAmount,
      'createdAt': DateTimeJsonFormatter.dateTimeToEpochUs(instance.createdAt),
      'updatedAt': DateTimeJsonFormatter.dateTimeToEpochUs(instance.updatedAt),
      'failReason': instance.failReason,
    };
