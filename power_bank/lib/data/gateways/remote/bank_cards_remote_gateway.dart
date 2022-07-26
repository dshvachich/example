import 'package:dio/dio.dart';
import 'package:power_bank/domain/entities/network/response/bank_cards_response.dart';
import 'package:power_bank/domain/entities/network/response/base_response.dart';
import 'package:retrofit/retrofit.dart';

part 'bank_cards_remote_gateway.g.dart';

@RestApi()
abstract class BankCardsRemoteGateway {
  factory BankCardsRemoteGateway({required Dio dio, String? baseUrl}) {
    final apiClient = _BankCardsRemoteGateway(dio, baseUrl: baseUrl);
    return apiClient;
  }

  @GET('/common/bank-card/my-list')
  Future<HttpResponse<BaseResponse<BankCardsResponse>>> getCards();

  @POST('/common/bank-card/delete')
  @FormUrlEncoded()
  Future<HttpResponse<BaseResponse>> deleteCard({
    @Field('bankCardId') required int cardId,
  });
}
