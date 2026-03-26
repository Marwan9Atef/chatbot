import 'package:dio/dio.dart';
import 'package:chatbot/feature/chat/data/models/chat_message_model.dart';
import 'package:chatbot/core/networking/api_client.dart';

class GemenaiChatService {
  final DioApiClient _apiClient;

  GemenaiChatService({required DioApiClient apiClient})
      : _apiClient = apiClient;

  Future<ChatMessageModel> sendMessage({
    required List<ChatMessageModel> messages,
  }) async {
    Object exception = Exception('All retry attempts failed');
    for (int i = 0; i < 3; i++) {
      try {
        var response = await _apiClient.post(
          '/gemini-3-flash-preview:generateContent',
          data: {
            "contents": messages.map((message) => message.toJson()).toList(),
          },
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "x-goog-api-key": "AIzaSyBx-QI43sjKTOR4vtbVMS2X-UxgF4yvMlk",
            },
          ),
        );
        return ChatMessageModel.fromJson(
            response['candidates'][0]['content'] as Map<String, dynamic>);
      } catch (e) {
        exception = e;
      }
    }
    throw exception;
  }
}
