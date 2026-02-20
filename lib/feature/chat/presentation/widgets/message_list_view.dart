import 'package:chatbot/feature/chat/data/models/chat_message_model.dart';
import 'package:chatbot/feature/chat/presentation/widgets/loading_message_item.dart';
import 'package:chatbot/feature/chat/presentation/widgets/message_item.dart';
import 'package:flutter/material.dart';

class MessageListView extends StatelessWidget {
  const MessageListView({super.key, required this.messages, required this.isLoading});
  final List<ChatMessageModel> messages;
  final bool isLoading;
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: false,
      itemCount: isLoading ? messages.length + 1 : messages.length,
      itemBuilder: (context, index) {
        if (isLoading && index == messages.length) {
          return LoadingMessageItem();
        }
        return MessageItem(chatMessage: messages[index]);
      },
    );
  }
}