import 'package:chatbot/core/error/app_exception.dart';
import 'package:chatbot/core/failure/failure.dart';
import 'package:chatbot/feature/chat/data/data_source/chat_remote_data_source.dart';
import 'package:chatbot/feature/chat/data/models/chat_request.dart';
import 'package:chatbot/feature/chat/domain/repository/chat_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ChatRepo)
class ChatRepoImpl implements ChatRepo {
  final ChatRemoteDataSource _remoteDataSource;
  ChatRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, String>> sendMessage(String message) async {
    try {
      final response = await _remoteDataSource.sendMessage(
        ChatRequest(
          contents: [
            Contents(parts: [Parts(text: message)]),
          ],
        ),
      );
      return Right(response.candidates![0].content!.parts![0].text!);

    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}
