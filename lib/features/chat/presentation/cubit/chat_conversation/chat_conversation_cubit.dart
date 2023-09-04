import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:knowitall_chat_bot/core/custom_exceptions.dart';
import 'package:knowitall_chat_bot/features/chat/domain/entities/chat_message_entity.dart';
import 'package:knowitall_chat_bot/features/chat/domain/entities/prompt_entity.dart';
import 'package:knowitall_chat_bot/features/chat/domain/usecases/chat_conversation_usecase.dart';
import 'package:knowitall_chat_bot/features/global/const/app_const.dart';

part 'chat_conversation_state.dart';
///TRY Chat bot Different personalities
///1.You are an assistant that gives very short answers
///2.You are a highly knowledgeable assistant that is always happy to help.
///3.You speak in a 1930s detective style, always looking for clues and solving mysteries
///4.You love everything about nature and often provide answers with references to plants, animals, and the great outdoors.
///5.You're the kind-hearted person next door, always ready with a helpful tip or a comforting word.
String  sysContent = "You are a highly knowledgeable assistant that is always happy to help.";

class ChatConversationCubit extends Cubit<ChatConversationState> {
  final ChatConversationUseCase chatConversationUseCase;

  ChatConversationCubit({
    required this.chatConversationUseCase,
  }) : super(ChatConversationInitial());

  List<ChatMessageEntity> _chatMessages = [];
//You are a highly knowledgeable sex therapist


  List<dynamic> conversationArr = [
        {
          "role": 'system',
          "content": sysContent,
        }
      ];

  Future<void> chatConversation({
    required ChatMessageEntity chatMessage,
    required Function(bool isReqComplete) onCompleteReqProcessing,
  }) async {
    try {
      _chatMessages.add(chatMessage);
      conversationArr.add({
        "role": 'user',
        "content": chatMessage.queryPrompt,
      });

      final prompt = PromptEntity(conversationArr: conversationArr);
      emit(
        ChatConversationLoaded(
          chatMessages: _chatMessages,
        ),
      );
      print("checkArr ${conversationArr}");
      final conversationData =
          await chatConversationUseCase.call(prompt, onCompleteReqProcessing);

      final aIChatMessageResponse = ChatMessageEntity(
          messageId: ChatGptConst.AIBot,
          promptResponse: conversationData.choices.first.message.content);

      _chatMessages.add(aIChatMessageResponse);

      emit(ChatConversationLoaded(
        chatMessages: _chatMessages,
      ));
    } on SocketException catch (e) {
      final aIChatMessageResponse = ChatMessageEntity(
          messageId: ChatGptConst.AIBot, promptResponse: e.message);

      _chatMessages.add(aIChatMessageResponse);

      emit(ChatConversationLoaded(
        chatMessages: _chatMessages,
      ));
    } on ChatGPTServerException catch (e) {
      final aIChatMessageResponse = ChatMessageEntity(
          messageId: ChatGptConst.AIBot, promptResponse: e.message);

      _chatMessages.add(aIChatMessageResponse);

      emit(ChatConversationLoaded(
        chatMessages: _chatMessages,
      ));
    }
  }

  Future<void> chatChat() async {
    emit(ChatConversationLoading());
    _chatMessages.clear();
    conversationArr.clear();
    conversationArr.add({
      "role": 'system',
      "content": sysContent,
    });
    emit(ChatConversationLoaded(
      chatMessages: _chatMessages,
    ));
  }
}
