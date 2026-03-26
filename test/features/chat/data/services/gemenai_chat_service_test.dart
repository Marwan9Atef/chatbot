import 'package:chatbot/core/networking/api_client.dart';
import 'package:chatbot/feature/chat/data/models/chat_message_model.dart';
import 'package:chatbot/feature/chat/data/models/chat_message_part_model.dart';
import 'package:chatbot/feature/chat/data/service/gemenai_chat_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DioApiClientMock extends Mock implements DioApiClient {}

void main() {
  late GemenaiChatService gmenaiChatService;
  late DioApiClientMock dioApiClientMock;

  final messages = [
    ChatMessageModel(
      parts: [ChatMessagePartModel(text: 'Hello')],
      role: 'user',
    ),
  ];

  final successResponse = {
    'candidates': [
      {
        'content': {
          'parts': [
            {'text': 'Hi there'},
          ],
          'role': 'model',
        },
      },
    ],
  };

  setUp(() {
    dioApiClientMock = DioApiClientMock();
    gmenaiChatService = GemenaiChatService(apiClient: dioApiClientMock);
  });

  group('Test retry logic', () {
    test(
      'fails all 3 attempts — throws last exception and post called exactly 3 times',
      () async {
        when(
          () => dioApiClientMock.post(
            any(),
            data: any(named: 'data'),
            options: any(named: 'options'),
          ),
        ).thenAnswer((_) => throw Exception());
        await expectLater(
          () => gmenaiChatService.sendMessage(messages: messages),
          throwsA(isA<Exception>()),
        );

        verify(
          () => dioApiClientMock.post(
            any(),
            data: any(named: 'data'),
            options: any(named: 'options'),
          ),
        ).called(3);
      },
    );

    test('succeed on third attempt', () async {
      var count = 0;
      when(
        () => dioApiClientMock.post(
          any(),
          data: any(named: 'data'),
          options: any(named: 'options'),
        ),
      ).thenAnswer((_) async {
        if (count == 2) {
          return successResponse;
        }
        count++;

        throw Exception();
      });

      var result = await gmenaiChatService.sendMessage(messages: messages);
      expect(result, isA<ChatMessageModel>());

      verify(
        () => dioApiClientMock.post(
          any(),
          data: any(named: 'data'),
          options: any(named: 'options'),
        ),
      ).called(3);
    });

    test('succeed on second attempt', () async {
      var count = 0;
      when(
        () => dioApiClientMock.post(
          any(),
          data: any(named: 'data'),
          options: any(named: 'options'),
        ),
      ).thenAnswer((_) async {
        if (count == 1) {
          return successResponse;
        }
        count++;

        throw Exception();
      });

      var result = await gmenaiChatService.sendMessage(messages: messages);
      expect(result, isA<ChatMessageModel>());

      verify(
        () => dioApiClientMock.post(
          any(),
          data: any(named: 'data'),
          options: any(named: 'options'),
        ),
      ).called(2);
    });

    test('succeed on first attempt', () async {
      when(
        () => dioApiClientMock.post(
          any(),
          data: any(named: 'data'),
          options: any(named: 'options'),
        ),
      ).thenAnswer((_) async {
        return successResponse;
      });

      var result = await gmenaiChatService.sendMessage(messages: messages);
      expect(result, isA<ChatMessageModel>());

      verify(
        () => dioApiClientMock.post(
          any(),
          data: any(named: 'data'),
          options: any(named: 'options'),
        ),
      ).called(1);
    });
  });
}
