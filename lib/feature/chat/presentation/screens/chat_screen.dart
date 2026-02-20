import 'package:chatbot/core/widgets/custom_app_bar.dart';
import 'package:chatbot/feature/chat/data/models/chat_message_model.dart';
import 'package:chatbot/feature/chat/presentation/widgets/chat_text_field.dart';
import 'package:chatbot/feature/chat/presentation/widgets/message_list_bloc_consumer.dart';
import 'package:flutter/material.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
final List<ChatMessageModel> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
            const Divider(height: 26, color: Color(0xffECECEC)),
            Expanded(child: MessageListBlocConsumer(messages: _messages)),
             ChatTextField(messages: _messages),
          ],
        ),
      ),
    );
  }
}