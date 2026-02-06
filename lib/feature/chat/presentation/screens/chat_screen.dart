import 'package:chatbot/core/widgets/custom_app_bar.dart';
import 'package:chatbot/feature/chat/presentation/cubit/chat_cubit.dart';
import 'package:chatbot/feature/chat/presentation/cubit/chat_states.dart';
import 'package:chatbot/feature/chat/presentation/widgets/chat_text_field.dart';
import 'package:chatbot/feature/chat/presentation/widgets/message_item.dart';
import 'package:chatbot/feature/chat/data/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              child: BlocBuilder<ChatCubit, ChatState>(
                buildWhen: (prev, curr) =>
                    prev.messages.length != curr.messages.length ||
                    prev.runtimeType != curr.runtimeType,
                builder: (context, state) {
                  final isLoading = state is ChatLoading;
                  return ListView.builder(
                    itemCount: state.messages.length + (isLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index < state.messages.length) {
                        final msg = state.messages[index];
                        return MessageItem(
                          message: msg,
                          key: ValueKey(msg.id),
                  
                        );
                      } else {
                        return MessageItem(
                          isLoading: true,
                          message: ChatModel(message: '', sender: Sender.ai),
                        );
                      }
                    },
                  );
                },
              ),
            ),
            ChatTextField(),
          ],
        ),
      ),
    );
  }
}
