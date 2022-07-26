import 'package:dio/dio.dart';
import 'package:power_bank/domain/entities/network/response/base_response.dart';
import 'package:power_bank/domain/entities/network/response/login_by_phone_response.dart';
import 'package:retrofit/retrofit.dart';

part 'authorization_remote_gateway.g.dart';

@RestApi()
abstract class AuthorizationRemoteGateway {
  factory AuthorizationRemoteGateway({required Dio dio, String? baseUrl}) {
    final apiClient = _AuthorizationRemoteGateway(dio, baseUrl: baseUrl);
    return apiClient;
  }

  @POST('/common/auth/send-sms')
  @FormUrlEncoded()
  Future<HttpResponse<BaseResponse>> sendSmsCode({
    @Field() required String phone,
  });

  @POST('/common/auth/login-by-phone')
  @FormUrlEncoded()
  Future<HttpResponse<BaseResponse<LoginByPhoneResponse>>> loginByPhone({
    @Field() required String phone,
    @Field() required String code,
  });
}
