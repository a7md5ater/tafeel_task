import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:tafeel_task/core/failures/cache_failure.dart';
import 'package:tafeel_task/core/failures/failure.dart';
import 'package:tafeel_task/core/failures/server_failure.dart';
import 'package:tafeel_task/core/network/network_info.dart';

mixin BaseRepositoryMixin {
  NetworkInfo get networkInfo;

  Future<Either<Failure, T>> handleApiCall<T>({
    required Future<T> Function() apiCall,
  }) async {
    if (await networkInfo.connected()) {
      try {
        final result = await apiCall();
        return Right(result);
      } on DioException catch (dioError) {
        return Left(ServerFailure(error: dioError));
      } on CacheFailure catch (cacheError) {
        return Left(cacheError);
      } catch (error) {
        return Left(RuntimeFailure(error: error));
      }
    } else {
      return Left(ServerFailure(error: NoInternetConnection()));
    }
  }
}
