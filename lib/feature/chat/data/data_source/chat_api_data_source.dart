import 'package:chatbot/core/constant/Api_constant.dart';
import 'package:chatbot/core/error/app_exception.dart';
import 'package:chatbot/feature/chat/data/data_source/chat_remote_data_source.dart';
import 'package:chatbot/feature/chat/data/models/chat_request.dart';
import 'package:chatbot/feature/chat/data/models/chat_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ChatRemoteDataSource)
class ChatAPIDataSource implements ChatRemoteDataSource {
  final Dio _dio;
  ChatAPIDataSource(this._dio);
  @override
  Future<ChatResponse> sendMessage(ChatRequest request) async {
    try {
      final response = await _dio.post(
        APIConstant.chatEndpoint,
        data: request.toJson(),
      );
      return ChatResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response!.data["error"]['message'];
      }
      throw RemoteException(message ?? "Something went wrong");
    }
  }
}
