import 'package:json_annotation/json_annotation.dart';

part 'login_by_phone_response.g.dart';

@JsonSerializable()
class LoginByPhoneResponse {
  LoginByPhoneResponse({
    required this.accessToken,
    required this.isAlreadyRegistered,
  });

  String accessToken;
  int isAlreadyRegistered;

  factory LoginByPhoneResponse.fromJson(Map<String, dynamic> json) => _$LoginByPhoneResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginByPhoneResponseToJson(this);
}
