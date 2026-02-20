import 'package:chatbot/feature/chat/data/models/chat_message_model.dart';
import 'package:chatbot/feature/chat/domain/repo/chat_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  SendMessageCubit({required this.chatRepo}) : super(SendMessageInitial());
  final ChatRepo chatRepo;

  Future<void> sendChatMessages(List<ChatMessageModel> messages) async {
    emit(SendMessageLoading());
    try {
      final chat = await chatRepo.senChatMessages(messages: messages);
      emit(SendMessageSuccess(chat: chat));
    } catch (e) {
      emit(SendMessageError(error: e.toString()));
    }
  }
}
