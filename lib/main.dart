import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:knowitall_chat_bot/core/http_certificate_manager.dart';
import 'package:knowitall_chat_bot/features/app/splash/splash_page.dart';
import 'package:knowitall_chat_bot/features/chat/presentation/cubit/chat_conversation/chat_conversation_cubit.dart';
import 'package:knowitall_chat_bot/features/chat/presentation/pages/chat/chat_page.dart';
import 'package:knowitall_chat_bot/features/global/const/app_const.dart';

import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await dotenv.load(fileName: ".env", mergeWith: {
    'TEST_VAR': '5',
  });
  await di.init();

  runApp(const ChatGPTApp());
}

class ChatGPTApp extends StatelessWidget {
  const ChatGPTApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatConversationCubit>(
          create: (_) => di.sl<ChatConversationCubit>(),
        ),
      ],
      child: MaterialApp(
        title: AppConst.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark,useMaterial3: true),
        initialRoute: '/',
        routes: {
          "/": (context) {
            return const SplashPage(
              child: ChatPage(),
            );
          }
        },
      ),
    );
  }
}
