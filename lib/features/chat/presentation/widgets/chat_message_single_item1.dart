import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:knowitall_chat_bot/features/chat/domain/entities/chat_message_entity.dart';
import 'package:knowitall_chat_bot/features/chat/presentation/widgets/single_message_layout_widget.dart';

class ChatMessageSingleItem1 extends StatelessWidget {
  final ChatMessageEntity chatMessage;

  const ChatMessageSingleItem1({Key? key, required this.chatMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [
        SlideEffect(begin: Offset(0, 1), duration: Duration(milliseconds: 300))
      ],
      child: SingleMessageLayoutWidget(
        chatMessage: chatMessage,
      ),
    );
  }
}
