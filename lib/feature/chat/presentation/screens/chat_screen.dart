import 'package:chatbot/core/widgets/custom_app_bar.dart';
import 'package:chatbot/core/widgets/chat_text_field.dart';
import 'package:chatbot/feature/chat/presentation/widgets/message_item.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
            const Divider(height: 26, color: Color(0xffECECEC)),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    MessageItem(isCurrentUser: index % 2 == 0, text: "Hello"),
                itemCount: 10,
              ),
            ),
            ChatTextField(
              onSend: () {
                // Handle send message
              },
              onMicrophoneTap: () {
                // Handle microphone tap
              },
            ),
          ],
        ),
      ),
    );
  }
}
