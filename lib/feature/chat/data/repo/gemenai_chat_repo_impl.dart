import 'package:chatbot/feature/chat/data/models/chat_message_model.dart';
import 'package:chatbot/feature/chat/data/service/gemenai_chat_service.dart';
import 'package:chatbot/feature/chat/domain/repo/chat_repo.dart';

class GemenaiChatRepoImpl extends ChatRepo {
  final GemenaiChatService _gemenaiChatService;
  GemenaiChatRepoImpl({required GemenaiChatService gemenaiChatService}) : _gemenaiChatService = gemenaiChatService;
  @override
  Future<ChatMessageModel> senChatMessages({
    required List<ChatMessageModel> messages,
  }) async {
    return await _gemenaiChatService.sendChatMessages(messages);
  }
}
