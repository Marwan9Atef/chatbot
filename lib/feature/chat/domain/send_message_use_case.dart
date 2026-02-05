import 'package:chatbot/core/failure/failure.dart' show Failure;
import 'package:chatbot/feature/chat/domain/repository/chat_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SendMessageUseCase {
  final ChatRepo _repo;
  SendMessageUseCase(this._repo);
  Future<Either<Failure,String>> call(String message)=>_repo.sendMessage(message);

}
