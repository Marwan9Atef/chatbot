import 'package:chatbot/core/constant/api_constant.dart';
import 'package:chatbot/core/networking/api_client.dart';
import 'package:chatbot/feature/chat/data/models/chat_message_model.dart';
import 'package:dio/dio.dart';

class GemenaiChatService {
  final ApiClient _apiClient = ApiClient();

  Future<ChatMessageModel> sendChatMessages(
    List<ChatMessageModel> messages,
  ) async {
    final response = await _apiClient.post(
      APIConstant.chatEndpoint,
      data: {"contents": messages.map((message) => message.toJson()).toList()},
      options: Options(
        headers: {
          'Content-Type': "application/json",
          'x-goog-api-key':APIConstant.apiKey,
        },
      ),
      
    );
    return ChatMessageModel.fromJson(response.data['candidates'][0]['content']);
  }
}
