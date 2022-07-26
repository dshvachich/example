import 'package:dartz/dartz.dart';
import 'package:power_bank/core/failures.dart';
import 'package:power_bank/core/network/network_info.dart';
import 'package:power_bank/core/repositories/base_repository.dart';
import 'package:power_bank/data/gateways/remote/product_rent_remote_gateway.dart';
import 'package:power_bank/domain/entities/network/product_rent.dart';
import 'package:power_bank/domain/entities/network/vending_machine.dart';

class ProductRentRepository extends BaseRepository {
  ProductRentRepository(
    NetworkInfo networkInfo, {
    required this.gateway,
  }) : super(networkInfo);

  ProductRentRemoteGateway gateway;

  Future<Either<VendingMachine, Failure>> checkRentalOption({
    required String code,
  }) async {
    try {
      var result = await sendRequest(gateway.checkRentalOption(code: code));
      return result.fold(
        (response) => Left(response.data?.vendingMachine),
        (error) => Right(error),
      );
    } catch (error) {
      return Right(Failure.network());
    }
  }

  Future<Either<ProductRent?, Failure>> getActiveRent() async {
    try {
      var result = await sendRequest(gateway.getActiveRent());
      return result.fold(
        (response) => Left(response.data?.productRent ?? null),
        (error) => Right(error),
      );
    } catch (error) {
      return Right(Failure.network());
    }
  }

  Future<Either<ProductRent, Failure>> completeRent({
    required String code,
    required int productRentId,
  }) async {
    try {
      var result = await sendRequest(gateway.completeRent(code: code, productRentId: productRentId));
      return result.fold(
        (response) => Left(response.data?.productRent),
        (error) => Right(error),
      );
    } catch (error) {
      return Right(Failure.network());
    }
  }

  Future<Either<ProductRent, Failure>> startRent({
    required int vendingMachineId,
    required int bankCardId,
  }) async {
    try {
      var result = await sendRequest(gateway.startRent(
        vendingMachineId: vendingMachineId,
        bankCardId: bankCardId,
      ));
      return result.fold(
        (response) => Left(response.data?.productRent),
        (error) => Right(error),
      );
    } catch (error) {
      return Right(Failure.network());
    }
  }
}
