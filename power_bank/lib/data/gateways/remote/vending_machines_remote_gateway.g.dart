// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vending_machines_remote_gateway.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _VendingMachinesRemoteGateway implements VendingMachinesRemoteGateway {
  _VendingMachinesRemoteGateway(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<BaseResponse<GetVendingMachinesResponse>>> getVendingMachines(
      {offset, limit, latitude, longitude}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'offset': offset,
      r'limit': limit,
      r'latitude': latitude,
      r'longitude': longitude
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<GetVendingMachinesResponse>>>(
            Options(method: 'GET', headers: _headers, extra: _extra, contentType: 'application/x-www-form-urlencoded')
                .compose(_dio.options, '/project/vending-machine/list', queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<GetVendingMachinesResponse>.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<VendingMachine>>> getVendingMachineDetails({required vendingMachineId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'vendingMachineId': vendingMachineId};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<HttpResponse<BaseResponse<VendingMachine>>>(
        Options(method: 'GET', headers: _headers, extra: _extra, contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, '/project/vending-machine/details', queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<VendingMachine>.fromJson(_result.data!);
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
