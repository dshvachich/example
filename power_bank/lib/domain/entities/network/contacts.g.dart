// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contacts _$ContactsFromJson(Map<String, dynamic> json) => Contacts(
      contactInfoId: json['contactInfoId'] as int,
      phones: (json['phones'] as List<dynamic>).map((e) => Phone.fromJson(e as Map<String, dynamic>)).toList(),
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      updatedAt: json['updatedAt'] as int?,
    );

Map<String, dynamic> _$ContactsToJson(Contacts instance) => <String, dynamic>{
      'contactInfoId': instance.contactInfoId,
      'phones': instance.phones,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'updatedAt': instance.updatedAt,
    };
