import 'package:dartz/dartz.dart';
import 'package:power_bank/core/failures.dart';
import 'package:power_bank/core/network/network_info.dart';
import 'package:power_bank/core/repositories/base_repository.dart';
import 'package:power_bank/data/gateways/remote/user_remote_gateway.dart';
import 'package:power_bank/domain/entities/network/tariff.dart';
import 'package:power_bank/domain/entities/network/user.dart';

class UserRepository extends BaseRepository {
  UserRepository(
    NetworkInfo networkInfo, {
    required this.gateway,
  }) : super(networkInfo);

  UserRemoteGateway gateway;

  Future<Either<User, Failure>> getUser() async {
    try {
      var result = await sendRequest(gateway.getUser());
      return result.fold(
        (response) => Left(response.data?.user),
        (error) => Right(error),
      );
    } catch (error) {
      return Right(Failure.network());
    }
  }

  Future<Either<List<Tariff>, Failure>> getTariffs() async {
    try {
      var result = await sendRequest(gateway.getTariffs());
      return result.fold(
        (response) => Left(response.data?.tariffs),
        (error) => Right(error),
      );
    } catch (error) {
      return Right(Failure.network());
    }
  }
}
