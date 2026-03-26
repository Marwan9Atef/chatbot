import 'package:flutter/material.dart';
import 'package:chatbot/feature/chat/presentation/screens/chat_screen.dart';
import 'package:flutter_test/flutter_test.dart';

class ChatRobot {
  final WidgetTester tester;

  ChatRobot({required this.tester});

  Future<void> runApp() async {
    await tester.pumpWidget(MaterialApp(home: ChatScreen()));
    await tester.pumpAndSettle();
  }

  Future<void> enterText({required String text}) async {
    var inputField = find.byType(TextField);
    await tester.enterText(inputField, text);
    await tester.pumpAndSettle();
  }

  Future<void> sendMessage() async {
    var sendButton = find.byKey(const Key('send_button'));
    await tester.tap(sendButton);
  }

  Future<void> retrySendingMessage() async {
    var resendButton = find.byIcon(Icons.refresh);
    await tester.tap(resendButton);
    await tester.pumpAndSettle();
  }
}
