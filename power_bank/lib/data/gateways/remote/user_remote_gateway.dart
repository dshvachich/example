import 'package:dio/dio.dart';
import 'package:power_bank/domain/entities/network/response/base_response.dart';
import 'package:power_bank/domain/entities/network/response/get_tariffs_response.dart';
import 'package:power_bank/domain/entities/network/response/get_user_response.dart';
import 'package:retrofit/retrofit.dart';

part 'user_remote_gateway.g.dart';

@RestApi()
abstract class UserRemoteGateway {
  factory UserRemoteGateway({required Dio dio, String? baseUrl}) {
    final apiClient = _UserRemoteGateway(dio, baseUrl: baseUrl);
    return apiClient;
  }

  @GET('/common/user/profile')
  Future<HttpResponse<BaseResponse<GetUserResponse>>> getUser();

  @GET('/project/tariff/list')
  Future<HttpResponse<BaseResponse<GetTariffsResponse>>> getTariffs();
}
