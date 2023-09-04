import 'package:knowitall_chat_bot/features/chat/data/model/message_data.dart';

class ChatConversationData {
  final MessageData message;
  final num index;
  final String finish_reason;


  ChatConversationData({
    required this.message,
    required this.index,
    required this.finish_reason,
  });


  factory ChatConversationData.fromJson(Map<String, dynamic> json) {
    return ChatConversationData(
      message: MessageData.fromJson(json['message']),
      index: json['index'],
      finish_reason: json['finish_reason'],
    );
  }


  Map<String,dynamic> toJson() =>{
    "message":message,
    "index":index,
    "finish_reason":finish_reason,
  };

}
