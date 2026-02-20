import 'package:chatbot/core/widgets/custom_app_bar.dart';
import 'package:chatbot/feature/chat/presentation/widgets/chat_text_field.dart';
import 'package:chatbot/feature/chat/presentation/widgets/message_list_view.dart';
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
            Expanded(child: MessageListView()),
            ChatTextField(onSendMessage: (String value) { 

             },),
          ],
        ),
      ),
    );
  }
}