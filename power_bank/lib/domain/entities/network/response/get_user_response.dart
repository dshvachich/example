import 'package:json_annotation/json_annotation.dart';
import 'package:power_bank/domain/entities/network/user.dart';

part 'get_user_response.g.dart';

@JsonSerializable()
class GetUserResponse {
  GetUserResponse({
    required this.user,
  });

  final User user;

  factory GetUserResponse.fromJson(Map<String, dynamic> json) => _$GetUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserResponseToJson(this);
}
