part of 'send_message_cubit.dart';

@immutable
sealed class SendMessageState {}

final class SendMessageInitial extends SendMessageState {}

final class SendMessageLoading extends SendMessageState {}

final class SendMessageSuccess extends SendMessageState {
  final ChatMessageModel chat;

  SendMessageSuccess({required this.chat});
}

final class SendMessageError extends SendMessageState {
  final String error;

  SendMessageError({required this.error});
}
