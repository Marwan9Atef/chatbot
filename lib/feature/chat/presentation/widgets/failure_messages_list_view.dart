import 'package:chatbot/feature/chat/data/models/chat_message_model.dart';
import 'package:chatbot/feature/chat/presentation/cubit/send_message_cubit.dart';
import 'package:chatbot/feature/chat/presentation/widgets/error_message_item.dart';
import 'package:chatbot/feature/chat/presentation/widgets/message_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FailureMessagesListView extends StatelessWidget {
  const FailureMessagesListView(this.messages, {super.key});
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
          return FailureChatMessageBubbleWidget(
            errorMessage: 'Error',
            lastSentMessage: messages.last.displayText,
            onResend: () {
              context.read<SendMessageCubit>().sendMessage(messages: messages);
            },
          );
        }
        final msg = messages[newIndex];
        return Visibility(
          visible: _hideIfErrorMessage(index),
          child: ChatMessageBubbleWidget(chatMessage: msg),
        );
      },
    );
  }

  bool _hideIfErrorMessage(int index) {
    return !(index == 1);
  }
}
