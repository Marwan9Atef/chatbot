
import 'package:chatbot/feature/chat/data/models/chat_model.dart';

abstract class ChatState {
  final List<ChatModel> messages;
  const ChatState({required this.messages});
}

class ChatInitial extends ChatState {
  const ChatInitial({required super.messages});
}

class ChatLoading extends ChatState {
  const ChatLoading({required super.messages});
}

class ChatSuccess extends ChatState {
  const ChatSuccess({required super.messages});
}

class ChatFailure extends ChatState {
  final String error;
  const ChatFailure({required super.messages, required this.error});
}
