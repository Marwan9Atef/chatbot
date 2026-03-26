import 'package:chatbot/feature/chat/data/models/chat_message_model.dart';

abstract class ChatRepo {
  Future<ChatMessageModel> sendMessage({
    required List<ChatMessageModel> messages,
  });
}
