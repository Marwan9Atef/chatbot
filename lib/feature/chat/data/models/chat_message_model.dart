class ChatMessageModel {
  ChatMessageModel({
      this.parts, 
      this.role,});

  factory ChatMessageModel.fromUser(String text, {String role = 'user'}) =>
      ChatMessageModel(
        parts: [Parts(text: text)],
        role: role,
      );

  ChatMessageModel.fromJson(dynamic json) {
    if (json['parts'] != null) {
      parts = [];
      json['parts'].forEach((v) {
        parts?.add(Parts.fromJson(v));
      });
    }
    role = json['role'];
  }
  List<Parts>? parts;
  String? role;
ChatMessageModel copyWith({  List<Parts>? parts,
  String? role,
}) => ChatMessageModel(  parts: parts ?? this.parts,
  role: role ?? this.role,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (parts != null) {
      map['parts'] = parts?.map((v) => v.toJson()).toList();
    }
    map['role'] = role;
    return map;
  }

}

class Parts {
  Parts({
      this.text, 
      this.thoughtSignature,});

  Parts.fromJson(dynamic json) {
    text = json['text'];
    thoughtSignature = json['thoughtSignature'];
  }
  String? text;
  String? thoughtSignature;
Parts copyWith({  String? text,
  String? thoughtSignature,
}) => Parts(  text: text ?? this.text,
  thoughtSignature: thoughtSignature ?? this.thoughtSignature,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['thoughtSignature'] = thoughtSignature;
    return map;
  }

}