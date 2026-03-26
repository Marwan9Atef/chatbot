import 'package:chatbot/core/init/di.dart';
import 'package:chatbot/feature/chat/data/models/chat_message_model.dart';
import 'package:chatbot/feature/chat/data/models/chat_message_part_model.dart';
import 'package:chatbot/feature/chat/domain/repo/chat_repo.dart';
import 'package:chatbot/feature/chat/presentation/widgets/message_item.dart';
import 'package:chatbot/feature/chat/presentation/widgets/error_message_item.dart';
import 'package:chatbot/feature/chat/presentation/widgets/loading_message_item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';

import 'chat_robot.dart';

class ChatMockrepo extends Mock implements ChatRepo {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late ChatMockrepo chatMockrepo;

  setUp(() async {
    await getIt.reset();
    setupGetIt();
    await getIt.unregister<ChatRepo>();
    chatMockrepo = ChatMockrepo();
    getIt.registerLazySingleton<ChatRepo>(() => chatMockrepo);
  });

  group("Test Sending message flow", () {
    testWidgets("Send message and show loading bubble widget",
        (tester) async {
      ChatRobot chatRobot = ChatRobot(tester: tester);
      when(
        () => chatMockrepo.sendMessage(messages: any(named: 'messages')),
      ).thenAnswer((_) {
        return Future.delayed(const Duration(seconds: 2), () {
          return ChatMessageModel(
            parts: [ChatMessagePartModel(text: 'response')],
            role: 'model',
          );
        });
      });
      await chatRobot.runApp();
      await chatRobot.enterText(text: 'hello');
      await chatRobot.sendMessage();
      await tester.pump();
      expect(find.byType(ChatMessageBubbleWidget), findsOneWidget);
      expect(find.byType(LoadingChatMessageBubbleWidget), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets("Send message and receive response message", (tester) async {
      ChatRobot chatRobot = ChatRobot(tester: tester);
      when(
        () => chatMockrepo.sendMessage(messages: any(named: 'messages')),
      ).thenAnswer((_) {
        return Future.delayed(const Duration(seconds: 2), () {
          return ChatMessageModel(
            parts: [ChatMessagePartModel(text: 'response')],
            role: 'model',
          );
        });
      });
      await chatRobot.runApp();
      await chatRobot.enterText(text: 'Hello');
      await chatRobot.sendMessage();
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byType(ChatMessageBubbleWidget),
          matching: find.text('Hello'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byType(ChatMessageBubbleWidget),
          matching: find.text('response'),
        ),
        findsOneWidget,
      );
    });

    testWidgets("Fails to send message", (tester) async {
      ChatRobot chatRobot = ChatRobot(tester: tester);
      when(
        () => chatMockrepo.sendMessage(messages: any(named: 'messages')),
      ).thenAnswer((_) async {
        await Future.delayed(const Duration(seconds: 2), () {});

        throw Exception();
      });
      await chatRobot.runApp();
      await chatRobot.enterText(text: "Hello");
      await chatRobot.sendMessage();
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byType(FailureChatMessageBubbleWidget),
          matching: find.text('Hello'),
        ),
        findsOneWidget,
      );
    });

    testWidgets("retry sending message and succeed", (tester) async {
      ChatRobot chatRobot = ChatRobot(tester: tester);
      var count = 0;
      when(
        () => chatMockrepo.sendMessage(messages: any(named: 'messages')),
      ).thenAnswer((_) async {
        await Future.delayed(const Duration(seconds: 2), () {});
        if (count == 1) {
          return ChatMessageModel(
            parts: [ChatMessagePartModel(text: 'response')],
            role: 'model',
          );
        }
        count++;
        throw Exception();
      });
      await chatRobot.runApp();
      await chatRobot.enterText(text: "Hello");
      await chatRobot.sendMessage();
      await tester.pumpAndSettle();
      await chatRobot.retrySendingMessage();
      expect(
        find.descendant(
          of: find.byType(ChatMessageBubbleWidget),
          matching: find.text('Hello'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byType(ChatMessageBubbleWidget),
          matching: find.text('response'),
        ),
        findsOneWidget,
      );
    });

    testWidgets("send message and fails on 5th attempt", (tester) async {
      ChatRobot chatRobot = ChatRobot(tester: tester);
      var count = 0;
      when(
        () => chatMockrepo.sendMessage(messages: any(named: 'messages')),
      ).thenAnswer((_) async {
        await Future.delayed(const Duration(seconds: 2), () {});
        if (count == 4) {
          throw Exception();
        }
        count++;
        return ChatMessageModel(
          parts: [ChatMessagePartModel(text: 'response')],
          role: 'model',
        );
      });
      await chatRobot.runApp();
      await chatRobot.enterText(text: "Hello");
      await chatRobot.sendMessage();
      await tester.pumpAndSettle();
      await chatRobot.enterText(text: "Hello");
      await chatRobot.sendMessage();
      await tester.pumpAndSettle();
      await chatRobot.enterText(text: "Hello");
      await chatRobot.sendMessage();
      await tester.pumpAndSettle();
      await chatRobot.enterText(text: "Hello");
      await chatRobot.sendMessage();
      await tester.pumpAndSettle();
      await chatRobot.enterText(text: "Hello");
      await chatRobot.sendMessage();
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byType(ChatMessageBubbleWidget),
          matching: find.text('Hello'),
        ),
        findsExactly(4),
      );
      expect(
        find.descendant(
          of: find.byType(FailureChatMessageBubbleWidget),
          matching: find.text('Hello'),
        ),
        findsOneWidget,
      );
    });
  });
}
