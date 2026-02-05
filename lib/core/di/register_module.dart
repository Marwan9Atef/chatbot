import 'package:chatbot/core/constant/Api_constant.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: APIConstant.baseUrl,
      receiveDataWhenStatusError: true,
      headers: {
        "Content-Type": "application/json",
        "X-goog-api-key": APIConstant.apiKey,
      },
    ),
  );
}