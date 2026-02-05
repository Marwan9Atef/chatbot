class ChatResponse {
  ChatResponse({
      this.candidates, 
      this.usageMetadata, 
      this.modelVersion, 
      this.responseId,});

  ChatResponse.fromJson(dynamic json) {
    if (json['candidates'] != null) {
      candidates = [];
      json['candidates'].forEach((v) {
        candidates?.add(Candidates.fromJson(v));
      });
    }
    usageMetadata = json['usageMetadata'] != null ? UsageMetadata.fromJson(json['usageMetadata']) : null;
    modelVersion = json['modelVersion'];
    responseId = json['responseId'];
  }
  List<Candidates>? candidates;
  UsageMetadata? usageMetadata;
  String? modelVersion;
  String? responseId;



}

class UsageMetadata {
  UsageMetadata({
      this.promptTokenCount, 
      this.candidatesTokenCount, 
      this.totalTokenCount, 
      this.promptTokensDetails, 
      this.thoughtsTokenCount,});

  UsageMetadata.fromJson(dynamic json) {
    promptTokenCount = json['promptTokenCount'];
    candidatesTokenCount = json['candidatesTokenCount'];
    totalTokenCount = json['totalTokenCount'];
    if (json['promptTokensDetails'] != null) {
      promptTokensDetails = [];
      json['promptTokensDetails'].forEach((v) {
        promptTokensDetails?.add(PromptTokensDetails.fromJson(v));
      });
    }
    thoughtsTokenCount = json['thoughtsTokenCount'];
  }
  int? promptTokenCount;
  int? candidatesTokenCount;
  int? totalTokenCount;
  List<PromptTokensDetails>? promptTokensDetails;
  int? thoughtsTokenCount;



}

class PromptTokensDetails {
  PromptTokensDetails({
      this.modality, 
      this.tokenCount,});

  PromptTokensDetails.fromJson(dynamic json) {
    modality = json['modality'];
    tokenCount = json['tokenCount'];
  }
  String? modality;
  int? tokenCount;

}

class Candidates {
  Candidates({
      this.content, 
      this.finishReason, 
      this.index,});

  Candidates.fromJson(dynamic json) {
    content = json['content'] != null ? Content.fromJson(json['content']) : null;
    finishReason = json['finishReason'];
    index = json['index'];
  }
  Content? content;
  String? finishReason;
  int? index;



}

class Content {
  Content({
      this.parts, 
      this.role,});

  Content.fromJson(dynamic json) {
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

}