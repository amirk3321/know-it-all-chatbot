import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final VoidCallback? onTap;
  final bool isRequestProcessing;

  const CustomTextField(
      {Key? key,
      required this.textEditingController,
      this.onTap,
      required this.isRequestProcessing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 28, left: 10, right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      blurRadius: 1,
                      spreadRadius: 1,
                      offset: Offset(0.0, 0.50))
                ]),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        constraints: const BoxConstraints(
                          maxHeight: 90,
                        ),
                        child: TextField(
                          style: const TextStyle(fontSize: 14),
                          controller: textEditingController,
                          decoration: const InputDecoration(
                            hintText: "Send a message",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    isRequestProcessing == true
                        ? Container(
                            height: 40,
                            child: Image.asset("assets/loading_response.gif"))
                        : InkWell(
                            onTap: textEditingController.text.isEmpty
                                ? null
                                : onTap,
                            child: Icon(
                              Icons.send,
                              color: textEditingController.text.isEmpty
                                  ? Colors.green.withOpacity(.4)
                                  : Colors.green,
                            ),
                          ),
                  ],
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
