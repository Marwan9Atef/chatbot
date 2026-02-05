import 'package:chatbot/feature/chat/data/models/chat_request.dart';
import 'package:chatbot/feature/chat/data/models/chat_response.dart';

abstract class ChatRemoteDataSource {
  Future<ChatResponse> sendMessage(ChatRequest request);



}