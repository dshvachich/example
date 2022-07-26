import 'package:json_annotation/json_annotation.dart';
import 'package:power_bank/domain/entities/network/phone.dart';

part 'contacts.g.dart';

@JsonSerializable()
class Contacts {
  Contacts({
    required this.contactInfoId,
    required this.phones,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.updatedAt,
  });

  final int contactInfoId;
  final List<Phone> phones;
  final String address;
  final double latitude;
  final double longitude;
  int? updatedAt;

  factory Contacts.fromJson(Map<String, dynamic> json) => _$ContactsFromJson(json);

  Map<String, dynamic> toJson() => _$ContactsToJson(this);
}
