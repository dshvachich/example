import 'package:json_annotation/json_annotation.dart';
import 'package:power_bank/domain/entities/network/contacts.dart';

part 'get_contacts_response.g.dart';

@JsonSerializable()
class GetContactsResponse {
  GetContactsResponse({
    required this.contactInfo,
  });

  final Contacts contactInfo;

  factory GetContactsResponse.fromJson(Map<String, dynamic> json) => _$GetContactsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetContactsResponseToJson(this);
}
