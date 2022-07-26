import 'package:json_annotation/json_annotation.dart';

part 'login_by_phone_body.g.dart';

@JsonSerializable()
class LoginByPhoneBody {
  LoginByPhoneBody({
    required this.phone,
    required this.code,
  });

  String phone;
  String code;

  factory LoginByPhoneBody.fromJson(Map<String, dynamic> json) => _$LoginByPhoneBodyFromJson(json);

  Map<String, dynamic> toJson() => _$LoginByPhoneBodyToJson(this);
}
