import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:knowitall_chat_bot/features/chat/domain/entities/chat_message_entity.dart';
import 'package:knowitall_chat_bot/features/chat/presentation/cubit/chat_conversation/chat_conversation_cubit.dart';
import 'package:knowitall_chat_bot/features/global/const/app_const.dart';

class SingleMessageLayoutWidget extends StatelessWidget {
  final ChatMessageEntity chatMessage;

  const SingleMessageLayoutWidget({Key? key, required this.chatMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _chatMessageItem(context);
  }

  _chatMessageItem(BuildContext context) {
    if (chatMessage.messageId == ChatGptConst.AIBot) {
      return Slidable(
        closeOnScroll: true,
        key: UniqueKey(),
        endActionPane: ActionPane(
          dragDismissible: true,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              backgroundColor: Colors.transparent,
              onPressed: (value) {
              },
              icon: Icons.delete_outline_outlined,
              label: "Delete",
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: 35,
                    width: 35,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset("assets/openAIChatbot.png"))),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 10),
                    child: Bubble(
                        nip: BubbleNip.leftTop,
                        color: Colors.blueGrey,
                        child: Text(
                          chatMessage.promptResponse!,
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              margin: const EdgeInsets.only(left: 50),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        Clipboard.setData(
                            ClipboardData(text: chatMessage.promptResponse!));
                      },
                      child: const Icon(Icons.copy, size: 18)),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                      onTap: () {
                        // Share.share(chatMessage.promptResponse!);
                      },
                      child: const Icon(Icons.share, size: 18)),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      );
    } else {
      return Slidable(
        key: UniqueKey(),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
                onPressed: (value) {},
                icon: Icons.delete_outline_outlined,
                backgroundColor: Colors.transparent,
                label: "Delete"),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 10, top: 10),
                child: Bubble(
                    nip: BubbleNip.rightTop,
                    color: Colors.blueAccent,
                    child: Text(
                      chatMessage.queryPrompt!,
                    )),
              ),
            ),
            Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50)),
                child: const Center(
                    child: Text(
                  "U",
                ))),
          ],
        ),
      );
      ;
    }
  }
}
