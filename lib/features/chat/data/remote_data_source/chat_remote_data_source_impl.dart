import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:knowitall_chat_bot/core/custom_exceptions.dart';
import 'package:knowitall_chat_bot/core/open_ai_data.dart';
import 'package:knowitall_chat_bot/features/chat/data/model/chat_conversation_model.dart';
import 'package:knowitall_chat_bot/features/chat/data/remote_data_source/chat_remote_data_source.dart';
import 'package:knowitall_chat_bot/features/chat/domain/entities/prompt_entity.dart';
import 'package:knowitall_chat_bot/features/global/provider/provider.dart';

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final http.Client httpClient;

  ChatRemoteDataSourceImpl({required this.httpClient});


  @override
  Future<ChatConversationModel> chatConversation(
  PromptEntity prompt,
    Function(bool isReqComplete) onCompleteReqProcessing,
  ) async {
    final String _endPoint = "chat/completions";

    onCompleteReqProcessing(true);
    final queryPrompt = prompt;
    final rowBodyEncodedParams = json.encode({
      "model": kOpenAIModel,
      "messages":prompt.conversationArr,
      // "temperature": 0.9,
      "max_tokens": 500,
      // "top_p": 1,
      "frequency_penalty": 0.3,
      "presence_penalty": 0, // -2, 2 = 0 ; 0.01 (low not good)
      "stop": ["Human:", "AI:"]
    });

    final response = await httpClient.post(
        Uri.parse(
          endPoint(
            _endPoint,
          ),
        ),
        body: rowBodyEncodedParams,
        headers: headerBearerOption(dotenv.get('OPENAI_KEY')));


    if (response.statusCode == 200){
      onCompleteReqProcessing(false);
      return ChatConversationModel.fromJson(json.decode(response.body));
    }else{
      onCompleteReqProcessing(false);
      throw ChatGPTServerException(message: json.decode(response.body)['error']['message']);
    }
  }
}
