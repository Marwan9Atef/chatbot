import 'package:dio/dio.dart';
import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      return _handleDioException(error);
    }
    return ApiErrorModel(message: 'An unexpected error occurred');
  }

  static ApiErrorModel _handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiErrorModel(message: 'Connection timeout with the server');
      case DioExceptionType.sendTimeout:
        return ApiErrorModel(message: 'Send timeout in connection with the server');
      case DioExceptionType.receiveTimeout:
        return ApiErrorModel(message: 'Receive timeout in connection with the server');
      case DioExceptionType.badCertificate:
        return ApiErrorModel(message: 'Incorrect certificate');
      case DioExceptionType.connectionError:
        return ApiErrorModel(message: 'No internet connection');
      case DioExceptionType.cancel:
        return ApiErrorModel(message: 'Request was cancelled');
      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response);
      case DioExceptionType.unknown:
        return ApiErrorModel(message: 'Something went wrong, please try again');
    }
  }

  static ApiErrorModel _handleBadResponse(Response? response) {
    if (response == null) {
      return ApiErrorModel(message: 'No response from server');
    }

    final data = response.data;
    if (data is Map<String, dynamic> && data.containsKey('error')) {
      return ApiErrorModel.fromJson(data['error'] as Map<String, dynamic>);
    }

    switch (response.statusCode) {
      case 400:
        return ApiErrorModel(message: 'Bad request', code: 400);
      case 401:
        return ApiErrorModel(message: 'Unauthorized', code: 401);
      case 403:
        return ApiErrorModel(message: 'Forbidden', code: 403);
      case 404:
        return ApiErrorModel(message: 'Not found', code: 404);
      case 429:
        return ApiErrorModel(message: 'Too many requests, please try again later', code: 429);
      case 500:
        return ApiErrorModel(message: 'Internal server error', code: 500);
      default:
        return ApiErrorModel(
          message: 'Server error with status code: ${response.statusCode}',
          code: response.statusCode,
        );
    }
  }
}
