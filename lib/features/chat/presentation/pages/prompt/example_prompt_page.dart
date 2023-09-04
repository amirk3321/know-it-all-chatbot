import 'package:flutter/material.dart';
import 'package:knowitall_chat_bot/features/chat/domain/entities/prompt_entity.dart';
import 'package:knowitall_chat_bot/features/global/provider/high_order_function.dart';

class ExamplePromptPage extends StatelessWidget {
  final OnMessageController onMessageController;
  const ExamplePromptPage({Key? key,required this.onMessageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.light_mode_outlined,
            size: 40,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Examples",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: PromptEntity.examplePrompts.length,
            itemBuilder: (context, index) {
              final prompt = PromptEntity.examplePrompts[index];
              return InkWell(
                onTap: (){
                  onMessageController(prompt.title!);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 3),
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Text("${prompt.title}"),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
