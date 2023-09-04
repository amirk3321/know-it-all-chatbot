import 'package:flutter/material.dart';
import 'package:knowitall_chat_bot/features/chat/domain/entities/prompt_entity.dart';

class PromptPage extends StatefulWidget {
  const PromptPage({Key? key}) : super(key: key);

  @override
  State<PromptPage> createState() => _PromptPageState();
}

class _PromptPageState extends State<PromptPage> {

  final _promptData = PromptEntity.promptData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Helpful Prompts"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: ListView.builder(
            itemCount: _promptData.length,
            itemBuilder: (context, index) {
              final pData = _promptData[index];
              if (pData.isPrompt == true) {
                return InkWell(
                    onTap: () {
                      Navigator.pop(context, pData.title);
                    },
                    child: Card(
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Text("${pData.title}"))));
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(thickness: 1.2, color: Colors.transparent),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${pData.title}",
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 1.2,
                    )
                  ],
                );
              }
            }),
      ),
    );
  }
}
