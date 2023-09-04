
import 'package:knowitall_chat_bot/core/open_ai_data.dart';

String endPoint(String endPoint) => "$baseURL/$endPoint";

Map<String, String> headerBearerOption(String token) => {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
