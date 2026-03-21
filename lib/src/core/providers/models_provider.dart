import 'package:aichat/src/core/constants/model_data.dart';
import 'package:aichat/src/core/enums/model_provider.dart';
import 'package:aichat/src/core/models/chat_model.dart';
import 'package:flutter/material.dart';

class ModelsProvider extends ChangeNotifier {
  Map<ModelProvider, List<ChatModel>> chatModels = Map.fromEntries(
    ModelProvider.values.map((provider) => MapEntry(provider, [])),
  );

  ChatModel? defaultChatModel;

  Future<void> initialize() async {
    final chatModelsData = modelData['chat'] ?? [];
    for (var modelProvider in chatModelsData) {
      final provider = ModelProvider.values.firstWhere(
        (provider) => provider.name == modelProvider['provider'],
      );

      for (var model in modelProvider['models'] as List<dynamic>) {
        final chatModel = ChatModel.fromMap(model as Map<String, dynamic>);
        if (chatModel.isDefault) {
          defaultChatModel = chatModel;
        }
        chatModels[provider]?.add(chatModel);
      }
    }
  }

  ModelProvider getModelProviderForChatModel(ChatModel chatModel) {
    return chatModels.entries
        .firstWhere(
          (entry) => entry.value.any((model) => model.id == chatModel.id),
          orElse: () => MapEntry(ModelProvider.openai, []),
        )
        .key;
  }
}
