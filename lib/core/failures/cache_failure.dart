import 'package:tafeel_task/core/failures/failure.dart';

class CacheFailure implements Failure {
  final dynamic error;

  CacheFailure({required this.error});

  CacheFailure.cacheMiss()
    : error = 'Cache miss: The requested data was not found in the cache.';

  CacheFailure.cacheCorruption()
    : error = 'Cache corruption: The cache data is invalid or corrupted.';

  @override
  String get message {
    if (error is Failure) {
      return (error as Failure).message;
    }
    return error.toString();
  }

  @override
  Map<String, dynamic>? get errorData => null;
}
