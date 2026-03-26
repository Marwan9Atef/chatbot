import 'package:chatbot/feature/chat/data/models/chat_message_model.dart';

mixin ChatServiceValidationMixin {
  void validateInput(List<ChatMessageModel> messages) {
    if (messages.isEmpty) {
      throw ArgumentError('Messages list cannot be empty.');
    }

    final lastMessage = messages.last;
    if (lastMessage.parts.isEmpty ||
        lastMessage.parts.every((p) => p.text.trim().isEmpty)) {
      throw ArgumentError('The last message must contain non-empty text.');
    }
  }

  void validateOutput(ChatMessageModel response) {
    if (response.parts.isEmpty) {
      throw FormatException('API returned a message with no parts.');
    }

    if (response.displayText.trim().isEmpty) {
      throw FormatException('API returned an empty response text.');
    }
  }
}
