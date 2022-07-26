import 'package:dartz/dartz.dart';
import 'package:power_bank/core/failures.dart';
import 'package:power_bank/core/network/network_info.dart';
import 'package:power_bank/core/repositories/base_repository.dart';
import 'package:power_bank/data/gateways/remote/authorization_remote_gateway.dart';
import 'package:power_bank/domain/entities/token_entity.dart';

class AuthorizationRepository extends BaseRepository {
  AuthorizationRepository(
    NetworkInfo networkInfo, {
    required this.gateway,
  }) : super(networkInfo);

  AuthorizationRemoteGateway gateway;

  Future<Either<bool, Failure>> sendSmsCode({required String phone}) async {
    try {
      var result = await sendRequest(gateway.sendSmsCode(phone: phone));
      return result.fold(
        (response) => Left(true),
        (error) => Right(error),
      );
    } catch (error) {
      return Right(Failure.network());
    }
  }

  Future<Either<TokenEntity, Failure>> loginByPhone({
    required String phone,
    required String code,
  }) async {
    try {
      var result = await sendRequest(
        gateway.loginByPhone(
          phone: phone,
          code: code,
        ),
      );
      return result.fold(
        (response) => Left(TokenEntity.fromResponse(response.data!)),
        (error) => Right(error),
      );
    } catch (error) {
      return Right(Failure.network());
    }
  }
}
