import 'package:equatable/equatable.dart';

class ChatMessageEntity extends Equatable {
  int? id;
  final String? messageId;
  final String? queryPrompt;
  final String? promptResponse;
  final int? pageLimit;

  ChatMessageEntity({
    this.messageId,
    this.queryPrompt,
    this.promptResponse,
    this.pageLimit,
  });

  @override
  List<Object?> get props => [
        queryPrompt,
        messageId,
        promptResponse,
        pageLimit,
      ];

  factory ChatMessageEntity.fromJson(Map<String, dynamic> json) {
    return ChatMessageEntity(
      messageId: json['messageId'],
      promptResponse: json['promptResponse'],
      queryPrompt: json['queryPrompt'],
    );
  }

  Map<String, dynamic> toJson() => {
        "messageId": messageId,
        "queryPrompt": queryPrompt,
        "promptResponse": promptResponse,
      };
}
