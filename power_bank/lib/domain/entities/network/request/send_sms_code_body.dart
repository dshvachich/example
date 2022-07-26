import 'package:json_annotation/json_annotation.dart';

part 'send_sms_code_body.g.dart';

@JsonSerializable()
class SendSmsCodeBody {
  SendSmsCodeBody({
    required this.phone,
  });

  String phone;

  factory SendSmsCodeBody.fromJson(Map<String, dynamic> json) => _$SendSmsCodeBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SendSmsCodeBodyToJson(this);
}
