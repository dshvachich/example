import 'package:dartz/dartz.dart';
import 'package:power_bank/core/failures.dart';
import 'package:power_bank/core/network/network_info.dart';
import 'package:power_bank/core/repositories/base_repository.dart';
import 'package:power_bank/data/gateways/remote/notifications_remote_gateway.dart';

class NotificationsRepository extends BaseRepository {
  NotificationsRepository(
    NetworkInfo networkInfo, {
    required this.gateway,
  }) : super(networkInfo);

  NotificationsRemoteGateway gateway;

  Future<Either<Unit, Failure>> setNotificationsToken(String token) async {
    try {
      var result = await sendRequest(gateway.setNotificationsToken(token));
      return result.fold(
        (response) => Left(unit),
        (error) => Right(error),
      );
    } catch (error) {
      return Right(Failure.network());
    }
  }

  Future<Either<Unit, Failure>> removeNotificationsToken(String token) async {
    try {
      var result = await sendRequest(gateway.removeNotificationsToken(token));
      return result.fold(
        (response) => Left(unit),
        (error) => Right(error),
      );
    } catch (error) {
      return Right(Failure.network());
    }
  }
}
