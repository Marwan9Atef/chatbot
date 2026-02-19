part of 'chat_cubit.dart';

@immutable

sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatLoading extends ChatState {}

final class ChatSuccess extends ChatState {
final ChatMessageModel chat;

  ChatSuccess({required this.chat});
}

final class ChatError extends ChatState {

  final String error;

  ChatError({required this.error});
}