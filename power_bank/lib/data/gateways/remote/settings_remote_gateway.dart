import 'package:dio/dio.dart';
import 'package:power_bank/domain/entities/network/response/base_response.dart';
import 'package:power_bank/domain/entities/network/response/get_settings_response.dart';
import 'package:retrofit/retrofit.dart';

part 'settings_remote_gateway.g.dart';

@RestApi()
abstract class SettingsRemoteGateway {
  factory SettingsRemoteGateway({required Dio dio, String? baseUrl}) {
    final apiClient = _SettingsRemoteGateway(dio, baseUrl: baseUrl);
    return apiClient;
  }

  @GET('/common/open/app-settings/app-settings')
  Future<HttpResponse<BaseResponse<GetSettingsResponse>>> getSettings();
}
