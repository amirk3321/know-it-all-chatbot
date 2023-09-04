import 'package:knowitall_chat_bot/features/chat/data/remote_data_source/chat_remote_data_source.dart';
import 'package:knowitall_chat_bot/features/chat/data/remote_data_source/chat_remote_data_source_impl.dart';
import 'package:knowitall_chat_bot/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:knowitall_chat_bot/features/chat/domain/repositories/chat_repository.dart';
import 'package:knowitall_chat_bot/features/chat/domain/usecases/chat_conversation_usecase.dart';
import 'package:knowitall_chat_bot/features/chat/presentation/cubit/chat_conversation/chat_conversation_cubit.dart';
import 'package:knowitall_chat_bot/injection_container.dart';

Future<void> chatInjectionContainer() async {
  sl.registerFactory<ChatConversationCubit>(
    () => ChatConversationCubit(
      chatConversationUseCase: sl.call(),
    ),
  );

  ///useCases
  sl.registerLazySingleton<ChatConversationUseCase>(
      () => ChatConversationUseCase(repository: sl.call()));

  ///Repository
  sl.registerLazySingleton<ChatRepository>(
      () => ChatRepositoryImpl(chatRemoteDataSource: sl.call()));

  ///remote data source
  sl.registerLazySingleton<ChatRemoteDataSource>(
    () => ChatRemoteDataSourceImpl(httpClient: sl.call()),
  );
}
