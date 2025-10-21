import 'package:dio/dio.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dio;

  static Dio getDio() {
    final Duration timeOut = const Duration(seconds: 30);
    if (_dio == null) {
      _dio = Dio();
      _dio!
        ..options.baseUrl = 'https://reqres.in/api/'
        ..options.headers = {
          'Content-Type': 'application/json',
          'x-api-key': 'reqres-free-v1',
        }
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut
        ..options.sendTimeout = timeOut;
      _addDioInterceptor();
    }
    return _dio!;
  }

  static void _addDioInterceptor() {
    _dio!.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ),
    );
  }
}
