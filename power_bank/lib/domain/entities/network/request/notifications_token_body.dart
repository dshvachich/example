import 'package:json_annotation/json_annotation.dart';

part 'notifications_token_body.g.dart';

@JsonSerializable()
class NotificationsTokenBody {
  NotificationsTokenBody({
    required this.pushToken,
  });

  String pushToken;

  factory NotificationsTokenBody.fromJson(Map<String, dynamic> json) => _$NotificationsTokenBodyFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsTokenBodyToJson(this);
}
