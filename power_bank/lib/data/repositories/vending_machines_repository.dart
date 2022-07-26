import 'package:dartz/dartz.dart';
import 'package:power_bank/core/failures.dart';
import 'package:power_bank/core/network/network_info.dart';
import 'package:power_bank/core/repositories/base_repository.dart';
import 'package:power_bank/data/gateways/remote/vending_machines_remote_gateway.dart';
import 'package:power_bank/domain/entities/network/vending_machine.dart';

class VendingMachinesRepository extends BaseRepository {
  VendingMachinesRepository(
    NetworkInfo networkInfo, {
    required this.gateway,
  }) : super(networkInfo);

  VendingMachinesRemoteGateway gateway;

  Future<Either<List<VendingMachine>, Failure>> getVendingMachines({
    int? offset,
    int? limit,
    double? latitude,
    double? longitude,
  }) async {
    try {
      var result = await sendRequest(gateway.getVendingMachines(
        offset: offset,
        limit: limit,
        latitude: latitude,
        longitude: longitude,
      ));
      return result.fold(
        (response) => Left(response.data?.vendingMachines),
        (error) => Right(error),
      );
    } catch (error) {
      return Right(Failure.network());
    }
  }

  Future<Either<VendingMachine, Failure>> getVendingMachineDetails({
    required int vendingMachineId,
  }) async {
    try {
      var result = await sendRequest(gateway.getVendingMachineDetails(
        vendingMachineId: vendingMachineId,
      ));
      return result.fold(
        (response) => Left(response.data),
        (error) => Right(error),
      );
    } catch (error) {
      return Right(Failure.network());
    }
  }
}
