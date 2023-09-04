import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knowitall_chat_bot/features/chat/domain/entities/chat_message_entity.dart';
import 'package:knowitall_chat_bot/features/chat/presentation/cubit/chat_conversation/chat_conversation_cubit.dart';
import 'package:knowitall_chat_bot/features/chat/presentation/pages/prompt/example_prompt_page.dart';
import 'package:knowitall_chat_bot/features/chat/presentation/pages/prompt/prompt_page.dart';
import 'package:knowitall_chat_bot/features/chat/presentation/widgets/chat_message_single_item1.dart';
import 'package:knowitall_chat_bot/features/global/const/app_const.dart';
import 'package:knowitall_chat_bot/features/global/custom_text_field/custom_text_field.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  bool _isRequestProcessing = false;
  String _queryPrompt = "";

  final ScrollController _scrollController = ScrollController();


  @override
  void initState() {
    _messageController.addListener(() {
      setState(() {});
    });

    if (_scrollController.hasClients) {
      Timer(
        const Duration(milliseconds: 100),
        () => _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500),
            curve: Curves.decelerate),
      );
    }

    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_scrollController.hasClients) {
      Timer(
        const Duration(milliseconds: 100),
        () => _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 500),
            curve: Curves.decelerate),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Know It All"),
            Text("Ask Me Anything",style: TextStyle(fontSize: 13),),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const PromptPage()))
                  .then((value) {
                if (value != null) {
                  setState(() {
                    _queryPrompt = value;
                  });

                  final HumanChatMessage = ChatMessageEntity(
                    messageId: ChatGptConst.Human,
                    queryPrompt: _queryPrompt,
                  );

                  BlocProvider.of<ChatConversationCubit>(context)
                      .chatConversation(
                          chatMessage: HumanChatMessage,
                          onCompleteReqProcessing: (isRequestProcessing) {
                            setState(() {
                              _isRequestProcessing = isRequestProcessing;
                            });
                          })
                      .then((value) {
                    setState(() {
                      _queryPrompt = "";
                    });

                    if (_scrollController.hasClients) {
                      Timer(
                        const Duration(milliseconds: 100),
                        () => _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.decelerate),
                      );
                    }

                  });
                }
              });
            },
            child: Container(
                padding: const EdgeInsets.only(right: 15),
                child: const Icon(Icons.live_help_outlined)),
          ),
          InkWell(onTap: (){
            context.read<ChatConversationCubit>().chatChat();
          },child: const Icon(Icons.clear)),
          const SizedBox(width: 10,),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatConversationCubit, ChatConversationState>(
                builder: (context, chatConversationState) {
              if (chatConversationState is ChatConversationLoaded) {

                final chatMessages = chatConversationState.chatMessages;

                if (chatMessages.isEmpty){
                  return ExamplePromptPage(
                    onMessageController: (message) {
                      _messageController.value = TextEditingValue(text: message);
                      Future.delayed(const Duration(milliseconds: 400), () {
                        _promptTriggerSaveCache();
                      });
                    },
                  );
                }else{
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: ListView.builder(
                      itemCount: _calculateListItemLength(chatMessages.length),
                      controller: _scrollController,
                      itemBuilder: (context, index) {
                        if (index >= chatMessages.length) {
                          return _responsePreparingWidget();
                        } else {
                          return ChatMessageSingleItem1(
                            chatMessage: chatMessages[index],
                          );
                        }
                      },
                    ),
                  );
                }
              }
              return ExamplePromptPage(
                onMessageController: (message) {
                  _messageController.value = TextEditingValue(text: message);
                  Future.delayed(Duration(milliseconds: 400), () {
                    _promptTriggerSaveCache();
                  });
                },
              );
            }),
          ),
          CustomTextField(
            isRequestProcessing: _isRequestProcessing,
            textEditingController: _messageController,
            onTap: () {
              _promptTriggerSaveCache();
            },
          ),
        ],
      ),
    );
  }

  Widget _responsePreparingWidget() {
    return SizedBox(
      height: 60,
      child: Image.asset("assets/loading_response.gif"),
    );
  }

  int _calculateListItemLength(int length) {
    if (_isRequestProcessing == false) {
      return length;
    } else {
      return length + 1;
    }
  }



  void _promptTriggerSaveCache() {
    if (_messageController.text.isEmpty) {
      return;
    }
    setState(() {
      _queryPrompt = _messageController.text;
      _messageController.clear();
    });
    final HumanChatMessage = ChatMessageEntity(
      messageId: ChatGptConst.Human,
      queryPrompt: _queryPrompt,
    );
    BlocProvider.of<ChatConversationCubit>(context)
        .chatConversation(
            chatMessage: HumanChatMessage,
            onCompleteReqProcessing: (isRequestProcessing) {
              setState(() {
                _isRequestProcessing = isRequestProcessing;
              });
            })
        .then((value) {
      setState(() {
        _queryPrompt = "";
      });
      if (_scrollController.hasClients) {
        Timer(
          const Duration(milliseconds: 100),
          () => _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 500),
              curve: Curves.decelerate),
        );
      }
    });
  }
}
