import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:power_bank/domain/entities/network/response/base_response.dart';
import 'package:retrofit/retrofit.dart';

import '../failures.dart';
import '../network/network_info.dart';

class BaseRepository {
  final NetworkInfo networkInfo;

  BaseRepository(this.networkInfo);

  Future<Either<M, Failure>> sendRequest<M extends BaseResponse>(Future<HttpResponse<M>> request) async {
    if (await networkInfo.isConnected) {
      try {
        HttpResponse<M> result = await request;
        int? code = result.response.statusCode;
        if (code.toString().startsWith('2')) {
          var data = result.response.data;
          if (data['meta']['success'] as bool) {
            return Left(result.data);
          } else {
            return Right(
              Failure.request(
                code: code,
                error: data['meta']['error'],
              ),
            );
          }
        } else {
          return Right(
            Failure.request(
              code: code,
              error: result.response.statusMessage,
            ),
          );
        }
      } on DioError catch (error) {
        return Right(Failure.request(code: error.response?.statusCode, error: error.response?.statusMessage));
      } catch (error) {
        return Right(Failure.undefined(error: error));
      }
    } else {
      return Right(Failure.network());
    }
  }
}
