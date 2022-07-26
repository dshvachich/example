import 'package:dio/dio.dart';
import 'package:power_bank/domain/entities/network/response/base_response.dart';
import 'package:power_bank/domain/entities/network/response/product_rent_response.dart';
import 'package:power_bank/domain/entities/network/response/vending_machine_response.dart';
import 'package:retrofit/retrofit.dart';

part 'product_rent_remote_gateway.g.dart';

@RestApi()
abstract class ProductRentRemoteGateway {
  factory ProductRentRemoteGateway({required Dio dio, String? baseUrl}) {
    final apiClient = _ProductRentRemoteGateway(dio, baseUrl: baseUrl);
    return apiClient;
  }

  @GET('/project/product-rent/check-rental')
  Future<HttpResponse<BaseResponse<VendingMachineResponse>>> checkRentalOption({
    @Query('qrCode') required String code,
  });

  @GET('/project/product-rent/get-active-rent')
  Future<HttpResponse<BaseResponse<ProductRentResponse>>> getActiveRent();

  @POST('/project/product-rent/complete-rent')
  Future<HttpResponse<BaseResponse<ProductRentResponse>>> completeRent({
    @Field('qrCode') required String code,
    @Field() required int productRentId,
  });

  @POST('/project/product-rent/start-rent')
  @FormUrlEncoded()
  Future<HttpResponse<BaseResponse<ProductRentResponse>>> startRent({
    @Field() required int vendingMachineId,
    @Field() required int bankCardId,
  });
}
