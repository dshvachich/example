import 'package:dio/dio.dart';
import 'package:power_bank/domain/entities/network/response/base_response.dart';
import 'package:retrofit/retrofit.dart';

part 'notifications_remote_gateway.g.dart';

@RestApi()
abstract class NotificationsRemoteGateway {
  factory NotificationsRemoteGateway({required Dio dio, String? baseUrl}) {
    final apiClient = _NotificationsRemoteGateway(dio, baseUrl: baseUrl);
    return apiClient;
  }

  @POST('/common/push/set-token')
  @FormUrlEncoded()
  Future<HttpResponse<BaseResponse>> setNotificationsToken(
    @Field() String pushToken,
  );

  @POST('/common/open/push/remove-token')
  @FormUrlEncoded()
  Future<HttpResponse<BaseResponse>> removeNotificationsToken(
    @Field() String pushToken,
  );
}
