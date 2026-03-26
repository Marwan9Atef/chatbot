import 'package:get_it/get_it.dart';
import 'package:chatbot/core/networking/api_client.dart';
import 'package:chatbot/feature/chat/data/repo/gemenai_chat_repo_impl.dart';
import 'package:chatbot/feature/chat/data/service/gemenai_chat_service.dart';
import 'package:chatbot/feature/chat/domain/repo/chat_repo.dart';
import 'package:chatbot/feature/chat/presentation/cubit/send_message_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<DioApiClient>(() => DioApiClient());

  getIt.registerLazySingleton<GemenaiChatService>(
    () => GemenaiChatService(apiClient: getIt()),
  );

  getIt.registerLazySingleton<ChatRepo>(
    () => GemenaiChatRepoImpl(gemenaiChatService: getIt()),
  );

  getIt.registerFactory<SendMessageCubit>(
    () => SendMessageCubit(chatRepo: getIt()),
  );
}
