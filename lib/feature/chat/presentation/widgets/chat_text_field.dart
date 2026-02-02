import 'package:chatbot/core/widgets/app_text_field.dart';
import 'package:chatbot/feature/chat/presentation/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ChatTextField extends StatefulWidget {
  const ChatTextField({super.key});

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
   
        context.read<ChatCubit>().sendUserMessage(_chatController.text);
        _chatController.clear();
      },
      onMicrophoneTap: () {
    
      },
    );
  }

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }
}
