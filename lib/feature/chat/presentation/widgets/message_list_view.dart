import 'package:chatbot/feature/chat/presentation/widgets/message_item.dart';
import 'package:flutter/material.dart';

class MessageListView extends StatelessWidget {
  const MessageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return MessageItem(message: "Hello", isCurrentUser: index % 2 == 0);
      },
    );
  }
}