class ChatRequest {
  ChatRequest({
      this.contents,});
  List<Contents>? contents;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (contents != null) {
      map['contents'] = contents?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Contents {
  Contents({
      this.parts,});


  List<Parts>? parts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (parts != null) {
      map['parts'] = parts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Parts {
  Parts({
      this.text,});

  String? text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    return map;
  }

}