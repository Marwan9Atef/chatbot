import 'package:chatbot/core/init/di.dart';
import 'package:chatbot/feature/chat/presentation/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() async {
    await getIt.reset();
    setupGetIt();
  });

  testWidgets('ChatScreen renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(home: const ChatScreen()),
    );

    expect(find.byType(ChatScreen), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });
}
