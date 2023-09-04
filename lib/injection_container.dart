

import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:knowitall_chat_bot/features/chat/chat_injection_container.dart';

final sl = GetIt.instance;

Future<void> init()async{

  final http.Client httpClient = http.Client();


  sl.registerLazySingleton<http.Client>(() => httpClient);

  await chatInjectionContainer();

}