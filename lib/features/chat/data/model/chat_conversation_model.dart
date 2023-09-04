
import 'package:knowitall_chat_bot/features/chat/data/model/chat_conversation_data.dart';

class ChatConversationModel {
  final num created;
  final List<ChatConversationData> choices;

  ChatConversationModel({required this.created, required this.choices});

  factory ChatConversationModel.fromJson(Map<String, dynamic> json) {

    final chatConversationMessageItem = json['choices'] as List;

    List<ChatConversationData> choices = chatConversationMessageItem
        .map((messageItem) => ChatConversationData.fromJson(messageItem))
        .toList();

    return ChatConversationModel(
      created: json['created'],
      choices: choices,
    );
  }
}
