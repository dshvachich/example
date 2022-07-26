import 'package:dartz/dartz.dart';
import 'package:power_bank/core/failures.dart';
import 'package:power_bank/core/network/network_info.dart';
import 'package:power_bank/core/repositories/base_repository.dart';
import 'package:power_bank/data/gateways/remote/bank_cards_remote_gateway.dart';
import 'package:power_bank/domain/entities/network/bank_card.dart';

class BankCardsRepository extends BaseRepository {
  BankCardsRepository(
    NetworkInfo networkInfo, {
    required this.gateway,
  }) : super(networkInfo);

  BankCardsRemoteGateway gateway;

  Future<Either<List<BankCard>, Failure>> getCards() async {
    try {
      var result = await sendRequest(gateway.getCards());
      return result.fold(
        (response) => Left(response.data?.bankCards),
        (error) => Right(error),
      );
    } catch (error) {
      return Right(Failure.network());
    }
  }

  Future<Either<bool, Failure>> deleteCard({
    required int cardId,
  }) async {
    try {
      var result = await sendRequest(gateway.deleteCard(cardId: cardId));
      return result.fold(
        (response) => Left(response.meta.success),
        (error) => Right(error),
      );
    } catch (error) {
      return Right(Failure.network());
    }
  }
}
