import 'package:json_annotation/json_annotation.dart';

part 'phone.g.dart';

@JsonSerializable()
class Phone {
  Phone({
    required this.phoneInfoId,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  final int phoneInfoId;
  final String phone;
  int createdAt;
  int updatedAt;

  factory Phone.fromJson(Map<String, dynamic> json) => _$PhoneFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneToJson(this);
}
