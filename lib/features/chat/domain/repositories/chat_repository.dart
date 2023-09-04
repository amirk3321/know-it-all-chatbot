
import 'package:knowitall_chat_bot/features/chat/data/model/chat_conversation_model.dart';
import 'package:knowitall_chat_bot/features/chat/domain/entities/prompt_entity.dart';

abstract class ChatRepository {
  Future<ChatConversationModel> chatConversation(
  PromptEntity prompt,
    Function(bool isReqComplete) onCompleteReqProcessing,
  );
}
