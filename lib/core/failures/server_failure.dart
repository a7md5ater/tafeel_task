import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:tafeel_task/core/failures/failure.dart';

class NoInternetConnection implements Exception {}

class ServerFailure extends Failure {
  final Object error;

  ServerFailure({required this.error});

  String _extractErrorMessage(dynamic responseData) {
    try {
      final data = responseData is String
          ? json.decode(responseData)
          : responseData;

      if (data is Map<String, dynamic>) {
        return _genericErrorExtraction(data);
      } else if (data is List && data.isNotEmpty) {
        final firstItem = data.first;
        if (firstItem is Map<String, dynamic> &&
            firstItem.containsKey('message')) {
          return _genericErrorExtraction(firstItem);
        }
        return firstItem.toString();
      }

      return 'Unknown Server Error';
    } catch (e) {
      return 'Unknown Server Error';
    }
  }

  String _genericErrorExtraction(Map<String, dynamic> data) {
    if (data.containsKey('message')) {
      return data['message']?.toString() ?? 'unknownError';
    } else if (data.containsKey('error')) {
      final errorField = data['error'];
      if (errorField is String) {
        return errorField;
      } else if (errorField is Map && errorField.containsKey('message')) {
        return errorField['message']?.toString() ?? 'unknownError';
      }
    } else if (data.containsKey('status')) {
      return data['status']?.toString() ?? 'unknownError';
    }

    return data.toString();
  }

  String _handleException() {
    if (error is DioException) {
      final DioException exception = error as DioException;

      switch (exception.type) {
        case DioExceptionType.cancel:
          return 'Request has been cancelled';

        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          return 'Connection timeout';

        case DioExceptionType.badResponse:
          final response = exception.response;

          if (response != null && response.data != null) {
            return _extractErrorMessage(response.data);
          }
          return 'Unknown Server Error';

        case DioExceptionType.badCertificate:
          return 'Invalid certificate';

        case DioExceptionType.connectionError:
          return 'Connection error';

        case DioExceptionType.unknown:
          print('Unknown Dio error: ${error.toString()}');
          return 'Unknown error';
      }
    } else if (error is NoInternetConnection) {
      return 'There is no internet connection, please check your internet connection.';
    } else {
      return error.toString();
    }
  }

  @override
  String get message => _handleException();
}
