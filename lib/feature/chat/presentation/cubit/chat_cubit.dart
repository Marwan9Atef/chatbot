import 'package:chatbot/feature/chat/data/models/chat_model.dart';
import 'package:chatbot/feature/chat/presentation/cubit/chat_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatState(messages: []));
  void sendUserMessage(String text) {
    if (text.trim().isEmpty) return;

    emit(
      ChatState(
        messages: [
          ...state.messages,
          ChatModel(message: text, sender: Sender.user),
        ],
      ),
      
    );

      _sendAiReply();
  }
    Future<void> _sendAiReply() async {
    await Future.delayed(const Duration(seconds: 1));

    emit(
      ChatState(
        messages: [
          ...state.messages,
           ChatModel(
            message: "Hello 👋 I'm your AI agent",
            sender: Sender.ai,
          ),
        ],
      ),
    );
  }

}
