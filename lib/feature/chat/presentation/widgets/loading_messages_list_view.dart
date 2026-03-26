import 'package:chatbot/feature/chat/data/models/chat_message_model.dart';
import 'package:chatbot/feature/chat/presentation/widgets/loading_message_item.dart';
import 'package:chatbot/feature/chat/presentation/widgets/message_item.dart';
import 'package:flutter/material.dart';

class LoadingMessagesListView extends StatelessWidget {
  const LoadingMessagesListView(this.messages, {super.key});
  final List<ChatMessageModel> messages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: messages.length + 1,
      itemBuilder: (context, index) {
        var newIndex = messages.length - (index + 0);
        if (index == 0) {
          return const LoadingChatMessageBubbleWidget();
        }
        final msg = messages[newIndex];
        return ChatMessageBubbleWidget(chatMessage: msg);
      },
    );
  }
}
