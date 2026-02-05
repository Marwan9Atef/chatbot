import 'package:uuid/uuid.dart';

enum Sender { user, ai }

class ChatModel {
  final String id;
  final String message;
  final Sender sender;
  final bool hasFailed;
  final String? errorMessage;

  ChatModel({
    String? id,
    required this.message,
    required this.sender,
    this.hasFailed = false,
    this.errorMessage,
  }) : id = id ?? const Uuid().v4();
}
