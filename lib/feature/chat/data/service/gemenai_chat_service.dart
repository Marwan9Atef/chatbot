import 'package:chatbot/core/constant/api_constant.dart';
import 'package:chatbot/core/networking/api_client.dart';
import 'package:chatbot/feature/chat/data/models/chat_message_model.dart';

class GemenaiChatService {
  final ApiClient _apiClient = ApiClient();

  Future<ChatMessageModel> sendChatMessages(
    List<ChatMessageModel> messages,
  ) async {
    final response = await _apiClient.post(
      APIConstant.chatEndpoint,
      data: {"contents": messages.map((message) => message.toJson()).toList()},
    );
    return ChatMessageModel.fromJson(response.data);
  }
}
