class ChatMessagePartModel {
  const ChatMessagePartModel({required this.text, this.thoughtSignature});

  final String text;
  final String? thoughtSignature;

  factory ChatMessagePartModel.fromJson(Map<String, dynamic> json) {
    return ChatMessagePartModel(
      text: json['text'] as String? ?? '',
      thoughtSignature: json['thoughtSignature'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'text': text,
        if (thoughtSignature != null) 'thoughtSignature': thoughtSignature,
      };
}
