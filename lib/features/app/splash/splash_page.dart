import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  final Widget? child;

  const SplashPage({Key? key, this.child}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {



  @override
  void initState() {
    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => widget.child!),
        (route) => false,
      );
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/openAIChatbot.png"),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Know It All Chatbot",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
