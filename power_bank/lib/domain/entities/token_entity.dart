import 'package:power_bank/domain/entities/network/response/login_by_phone_response.dart';

class TokenEntity {
  TokenEntity({
    required this.accessToken,
    required this.isAlreadyRegistered,
  });

  String accessToken;
  int isAlreadyRegistered;

  factory TokenEntity.fromResponse(LoginByPhoneResponse response) => TokenEntity(
        accessToken: response.accessToken,
        isAlreadyRegistered: response.isAlreadyRegistered,
      );
}
