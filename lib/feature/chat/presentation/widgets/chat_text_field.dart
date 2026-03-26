import 'package:chatbot/core/widgets/app_text_field.dart';
import 'package:chatbot/feature/chat/data/models/chat_message_model.dart';
import 'package:chatbot/feature/chat/presentation/cubit/send_message_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({
    super.key,
    required this.messages,
    this.onMicrophoneTap,
  });

  final List<ChatMessageModel> messages;
  final VoidCallback? onMicrophoneTap;

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  final TextEditingController _chatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: _chatController,
      onSend: () {
        final text = _chatController.text.trim();
        if (text.isEmpty) return;

        var sendMessageCubit = context.read<SendMessageCubit>();
        var message = ChatMessageModel.fromUserMessage(text);

        if (sendMessageCubit.state is SendMessageFailure) {
          widget.messages.removeLast();
        }

        widget.messages.add(message);
        sendMessageCubit.sendMessage(messages: widget.messages);

        _chatController.clear();
      },
      onMicrophoneTap: widget.onMicrophoneTap ?? () {},
    );
  }

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }
}
