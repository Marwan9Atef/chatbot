import 'package:chatbot/feature/chat/data/models/chat_message_model.dart';

abstract class ChatRepo {
  Future<ChatMessageModel> senChatMessages({
    required List<ChatMessageModel> messages,
  });
}
