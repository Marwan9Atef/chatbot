import 'package:chatbot/feature/chat/data/models/chat_message_part_model.dart';

class ChatMessageModel {
  const ChatMessageModel({required this.parts, required this.role});

  final List<ChatMessagePartModel> parts;
  final String role;

  factory ChatMessageModel.fromUserMessage(String content) {
    return ChatMessageModel(
      parts: [ChatMessagePartModel(text: content)],
      role: 'user',
    );
  }

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    final partsList = json['parts'] as List?;
    return ChatMessageModel(
      parts: partsList
              ?.map(
                (e) => ChatMessagePartModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
      role: json['role'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'parts': parts.map((e) => e.toJson()).toList(),
        'role': role,
      };

  String get displayText => parts.isNotEmpty ? parts.first.text : '';

  bool get isUser => role == 'user';
}
