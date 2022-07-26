import 'package:dio/dio.dart';
import 'package:power_bank/domain/entities/network/response/base_response.dart';
import 'package:power_bank/domain/entities/network/response/get_contacts_response.dart';
import 'package:retrofit/retrofit.dart';

part 'contacts_remote_gateway.g.dart';

@RestApi()
abstract class ContactsRemoteGateway {
  factory ContactsRemoteGateway({required Dio dio, String? baseUrl}) {
    final apiClient = _ContactsRemoteGateway(dio, baseUrl: baseUrl);
    return apiClient;
  }

  @GET('project/contact-info/get-contacts')
  Future<HttpResponse<BaseResponse<GetContactsResponse>>> getContacts();

  @POST('common/user/send-email')
  @FormUrlEncoded()
  Future<HttpResponse<BaseResponse>> sendFeedback({
    @Field('email') required String email,
    @Field('subject') required String subject,
    @Field('body') required String message,
  });
}
