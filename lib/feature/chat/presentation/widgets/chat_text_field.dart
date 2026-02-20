import 'package:chatbot/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({
    super.key,
    required this.onSendMessage,
    this.onMicrophoneTap,
  });

  final ValueChanged<String> onSendMessage;
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
        widget.onSendMessage(text);
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