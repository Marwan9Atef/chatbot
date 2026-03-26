part of 'send_message_cubit.dart';

@immutable
sealed class SendMessageState {}

final class SendMessageInitial extends SendMessageState {}

final class SendMessageLoading extends SendMessageState {}

final class SendMessageSuccess extends SendMessageState {
  final ChatMessageModel chatMessageModel;
  SendMessageSuccess({required this.chatMessageModel});
}

final class SendMessageFailure extends SendMessageState {
  final String error;
  SendMessageFailure({required this.error});
}
