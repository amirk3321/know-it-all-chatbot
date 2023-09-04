

import 'package:knowitall_chat_bot/features/chat/data/model/chat_conversation_model.dart';
import 'package:knowitall_chat_bot/features/chat/data/remote_data_source/chat_remote_data_source.dart';
import 'package:knowitall_chat_bot/features/chat/domain/entities/prompt_entity.dart';
import 'package:knowitall_chat_bot/features/chat/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource chatRemoteDataSource;


  ChatRepositoryImpl({required this.chatRemoteDataSource});

  @override
  Future<ChatConversationModel> chatConversation(PromptEntity prompt, Function(bool isReqComplete) onCompleteReqProcessing,) async =>
      chatRemoteDataSource.chatConversation(prompt, onCompleteReqProcessing);

}