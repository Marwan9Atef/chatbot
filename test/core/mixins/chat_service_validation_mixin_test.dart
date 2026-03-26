import 'package:chatbot/core/mixins/chat_service_validation_mixin.dart';
import 'package:chatbot/feature/chat/data/models/chat_message_model.dart';
import 'package:chatbot/feature/chat/data/models/chat_message_part_model.dart';
import 'package:flutter_test/flutter_test.dart';

class ChatServiceValidationMixinMock with ChatServiceValidationMixin {}

void main() {
  late ChatServiceValidationMixinMock chatServiceValidationMixinMock;
  setUp(() {
    chatServiceValidationMixinMock = ChatServiceValidationMixinMock();
  });

  group('Validate Input of Send Message', () {
    test("throw argument error when input list is empty ", () {
      expect(
        () => chatServiceValidationMixinMock.validateInput([]),
        throwsA(isA<ArgumentError>()),
      );
    });

    test("throws argument error if last message is empty", () {
      expect(
        () => chatServiceValidationMixinMock.validateInput([
          ChatMessageModel(parts: [], role: "user"),
        ]),
        throwsA(isA<ArgumentError>()),
      );
    });

    test("throws argument error text in part is empty ", () {
      expect(
        () => chatServiceValidationMixinMock.validateInput([
          ChatMessageModel(
            parts: [ChatMessagePartModel(text: "")],
            role: "user",
          ),
        ]),
        throwsA(isA<ArgumentError>()),
      );
    });
  });

  group("Test output of send message", () {
    test("response parts is empty", () async {
      expect(
        () => chatServiceValidationMixinMock.validateOutput(
          ChatMessageModel(parts: [], role: "user"),
        ),
        throwsA(isA<FormatException>()),
      );
    });

    test("display text is empty", () async {
      expect(
        () => chatServiceValidationMixinMock.validateOutput(
          ChatMessageModel(
            parts: [ChatMessagePartModel(text: '')],
            role: "user",
          ),
        ),
        throwsA(isA<FormatException>()),
      );
    });
  });
}
