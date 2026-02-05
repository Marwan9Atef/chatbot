import 'package:chatbot/core/failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ChatRepo {
Future<Either<Failure,String>> sendMessage(String message);



}