
import 'package:chatbot/feature/chat/data/models/chat_message_model.dart';
import 'package:chatbot/feature/chat/domain/repo/chat_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit({required this.chatRepo}) : super(ChatInitial());
  final ChatRepo chatRepo;

  Future<void> sendChatMessages(List<ChatMessageModel> messages) async {
    emit(ChatLoading());
    try {
      final chat = await chatRepo.senChatMessages(messages: messages);
      emit(ChatSuccess(chat: chat));
    } catch (e) {
      emit(ChatError(error: e.toString()));
    }
  }
}
