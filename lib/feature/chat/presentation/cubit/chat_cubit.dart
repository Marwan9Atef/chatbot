import 'package:chatbot/feature/chat/data/models/chat_model.dart';
import 'package:chatbot/feature/chat/domain/send_message_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'chat_states.dart';
@injectable
class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this._useCase) : super(const ChatInitial(messages: []));
  final SendMessageUseCase _useCase;

  void sendUserMessage(String text) {
    if (text.trim().isEmpty) return;

    final updatedMessages = [
      ...state.messages,
      ChatModel(message: text, sender: Sender.user),
    ];

    emit(ChatInitial(messages: updatedMessages));

    _sendAiReply(text);
  }

  Future<void> _sendAiReply(String text) async {
    emit(ChatLoading(messages: state.messages));
    final result = await _useCase(text);
    result.fold((error) {
      emit(ChatFailure(messages: state.messages, error: error.message));
    }, (response) {
      emit(ChatSuccess(messages: [...state.messages, ChatModel(message: response, sender: Sender.ai)]));
    });

  
  }
}
  // // 🔵 Loading
    // 

    // try {
    //   await Future.delayed(const Duration(seconds: 1));

    //   final aiReply = "Hello 👋 I'm your AI agent";

    //   final updatedMessages = [
    //     ...state.messages,
    //     ChatModel(message: aiReply, sender: Sender.ai),
    //   ];

    //   // ✅ Success
    //   emit(ChatSuccess(messages: updatedMessages));
    // } catch (e) {
    //   // 🔴 Failure
    //   emit(ChatFailure(messages: state.messages, error: e.toString()));
    // }