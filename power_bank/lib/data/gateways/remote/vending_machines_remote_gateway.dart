import 'package:dio/dio.dart';
import 'package:power_bank/domain/entities/network/response/base_response.dart';
import 'package:power_bank/domain/entities/network/response/get_vending_machines_response.dart';
import 'package:power_bank/domain/entities/network/vending_machine.dart';
import 'package:retrofit/retrofit.dart';

part 'vending_machines_remote_gateway.g.dart';

@RestApi()
abstract class VendingMachinesRemoteGateway {
  factory VendingMachinesRemoteGateway({required Dio dio, String? baseUrl}) {
    final apiClient = _VendingMachinesRemoteGateway(dio, baseUrl: baseUrl);
    return apiClient;
  }

  @GET('/project/vending-machine/list')
  @FormUrlEncoded()
  Future<HttpResponse<BaseResponse<GetVendingMachinesResponse>>> getVendingMachines({
    // @Query('accessToken') required String accessToken,
    @Query('offset') int? offset,
    @Query('limit') int? limit,
    @Query('latitude') double? latitude,
    @Query('longitude') double? longitude,
  });

  @GET('/project/vending-machine/details')
  @FormUrlEncoded()
  Future<HttpResponse<BaseResponse<VendingMachine>>> getVendingMachineDetails({
    // @Query('accessToken') required String accessToken,
    @Query('vendingMachineId') required int vendingMachineId,
  });
}
