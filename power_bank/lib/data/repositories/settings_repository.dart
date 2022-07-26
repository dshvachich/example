import 'package:dartz/dartz.dart';
import 'package:power_bank/core/failures.dart';
import 'package:power_bank/core/network/network_info.dart';
import 'package:power_bank/core/repositories/base_repository.dart';
import 'package:power_bank/data/gateways/remote/settings_remote_gateway.dart';
import 'package:power_bank/domain/entities/network/settings.dart';

class SettingsRepository extends BaseRepository {
  SettingsRepository(
    NetworkInfo networkInfo, {
    required this.gateway,
  }) : super(networkInfo);

  SettingsRemoteGateway gateway;

  Future<Either<Settings, Failure>> getSettings() async {
    try {
      var result = await sendRequest(gateway.getSettings());
      return result.fold(
        (response) => Left(response.data?.appConfig),
        (error) => Right(error),
      );
    } catch (error) {
      return Right(Failure.network());
    }
  }
}
