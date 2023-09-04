import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:knowitall_chat_bot/features/chat/domain/entities/chat_message_entity.dart';
import 'package:knowitall_chat_bot/features/global/const/app_const.dart';

class ChatMessageSingleItem extends StatelessWidget {
  final ChatMessageEntity chatMessage;

  const ChatMessageSingleItem({Key? key, required this.chatMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [
        SlideEffect(begin: Offset(0, 1), duration: Duration(milliseconds: 300))
      ],
      child: Card(
        elevation: chatMessage.messageId == ChatGptConst.AIBot ? null : 0.0,
        color: chatMessage.messageId == ChatGptConst.AIBot
            ? null
            : Colors.transparent,
        child: Container(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 45,
                width: 45,
                child: _getImage(),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(child: Text(chatMessage.queryPrompt!))
            ],
          ),
        ),
      ),
    );
  }

  _getImage() {
    if (chatMessage.messageId == ChatGptConst.AIBot) {
      return Image.asset("assets/openAIChatbot.png");
    } else {
      return Icon(
        Icons.account_circle_outlined,
        size: 40,
      );
    }
  }
}
