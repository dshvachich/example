import 'package:dartz/dartz.dart';
import 'package:power_bank/core/failures.dart';
import 'package:power_bank/core/network/network_info.dart';
import 'package:power_bank/core/repositories/base_repository.dart';
import 'package:power_bank/data/gateways/remote/contacts_remote_gateway.dart';
import 'package:power_bank/domain/entities/network/contacts.dart';

class ContactsRepository extends BaseRepository {
  ContactsRepository(
    NetworkInfo networkInfo, {
    required this.gateway,
  }) : super(networkInfo);

  ContactsRemoteGateway gateway;

  Future<Either<Contacts, Failure>> getContacts() async {
    try {
      var result = await sendRequest(gateway.getContacts());
      return result.fold(
        (response) => Left(response.data?.contactInfo),
        (error) => Right(error),
      );
    } catch (error) {
      return Right(Failure.network());
    }
  }

  Future<Either<bool, Failure>> sendFeedback({
    required String subject,
    required String email,
    required String message,
  }) async {
    try {
      var result = await sendRequest(gateway.sendFeedback(
        subject: subject,
        email: email,
        message: message,
      ));
      return result.fold(
        (response) => Left(response.meta.success),
        (error) => Right(error),
      );
    } catch (error) {
      return Right(Failure.network());
    }
  }
}
