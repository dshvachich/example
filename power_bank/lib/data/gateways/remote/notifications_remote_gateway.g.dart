// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_remote_gateway.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _NotificationsRemoteGateway implements NotificationsRemoteGateway {
  _NotificationsRemoteGateway(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<BaseResponse<dynamic>>> setNotificationsToken(pushToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'pushToken': pushToken};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<HttpResponse<BaseResponse<dynamic>>>(
        Options(method: 'POST', headers: _headers, extra: _extra, contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, '/common/push/set-token', queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<dynamic>.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<dynamic>>> removeNotificationsToken(pushToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'pushToken': pushToken};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<HttpResponse<BaseResponse<dynamic>>>(
        Options(method: 'POST', headers: _headers, extra: _extra, contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, '/common/open/push/remove-token', queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<dynamic>.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes || requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
