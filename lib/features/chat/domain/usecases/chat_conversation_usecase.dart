

import 'package:knowitall_chat_bot/features/chat/data/model/chat_conversation_model.dart';
import 'package:knowitall_chat_bot/features/chat/domain/entities/prompt_entity.dart';
import 'package:knowitall_chat_bot/features/chat/domain/repositories/chat_repository.dart';

class ChatConversationUseCase{
  final ChatRepository repository;

  ChatConversationUseCase({required this.repository});

  Future<ChatConversationModel> call(PromptEntity prompt,Function(bool isReqComplete) onCompleteReqProcessing){

    return repository.chatConversation(prompt,onCompleteReqProcessing);

  }
}