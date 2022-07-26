// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_contacts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetContactsResponse _$GetContactsResponseFromJson(Map<String, dynamic> json) => GetContactsResponse(
      contactInfo: Contacts.fromJson(json['contactInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetContactsResponseToJson(GetContactsResponse instance) => <String, dynamic>{
      'contactInfo': instance.contactInfo,
    };
