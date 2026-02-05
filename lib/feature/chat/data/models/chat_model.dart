import 'package:uuid/uuid.dart';

enum Sender { user, ai }

class ChatModel {
  final String id;
  final String message;
  final Sender sender;

  ChatModel({
    String? id,
    required this.message,
    required this.sender,
  }) : id = id ?? const Uuid().v4(); 
}
