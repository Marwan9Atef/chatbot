enum Sender{
user, ai 

}

class ChatModel{
  final String message;
  final Sender sender;
  ChatModel({required this.message, required this.sender});
}