import 'package:chatbot/feature/chat/data/models/chat_message_model.dart';
import 'package:chatbot/feature/chat/presentation/cubit/send_message_cubit.dart';
import 'package:chatbot/feature/chat/presentation/widgets/failure_messages_list_view.dart';
import 'package:chatbot/feature/chat/presentation/widgets/loading_messages_list_view.dart';
import 'package:chatbot/feature/chat/presentation/widgets/message_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageListBlocConsumer extends StatelessWidget {
  const MessageListBlocConsumer({super.key, required this.messages});
  final List<ChatMessageModel> messages;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendMessageCubit, SendMessageState>(
      listener: (context, state) {
        if (state is SendMessageSuccess) {
          messages.add(state.chatMessageModel);
        }
      },
      builder: (context, state) {
        if (state is SendMessageSuccess) {
          return MessagesListView(messages: messages);
        } else if (state is SendMessageFailure) {
          return FailureMessagesListView(messages);
        } else if (state is SendMessageLoading) {
          return LoadingMessagesListView(messages);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
