import 'package:aichat/src/core/enums/model_provider.dart';
import 'package:aichat/src/core/models/chat_model.dart';
import 'package:aichat/src/core/providers/models_provider.dart';
import 'package:aichat/src/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ModelPickerBottomSheet extends StatefulWidget {
  const ModelPickerBottomSheet({super.key, this.selectedChatModel});

  final ChatModel? selectedChatModel;

  @override
  State<ModelPickerBottomSheet> createState() => _ModelPickerBottomSheetState();
}

class _ModelPickerBottomSheetState extends State<ModelPickerBottomSheet> {
  ModelProvider provider = ModelProvider.openai;

  @override
  void initState() {
    if (widget.selectedChatModel != null) {
      provider = context.read<ModelsProvider>().getModelProviderForChatModel(
        widget.selectedChatModel!,
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelsProvider>(
      builder: (context, mp, child) {
        final chatModels = mp.chatModels[provider] ?? [];
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 8),
            Container(
              height: 4,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "${provider.label}(${chatModels.length})",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: AppTheme.dmMono,
                letterSpacing: -1,
              ),
            ),
            SizedBox(height: 16),
            Material(
              color: Colors.transparent,
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 8),
                    itemCount: chatModels.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final chatModel = chatModels[index];
                      final isSelected =
                          chatModel.id == widget.selectedChatModel?.id;
                      return ListTile(
                        onTap: () {
                          Navigator.pop(context, chatModel);
                        },
                        splashColor: Colors.transparent,
                        tileColor: isSelected
                            ? Colors.grey.shade100
                            : Colors.transparent,
                        shape: RoundedSuperellipseBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(26),
                          ),
                        ),
                        title: Row(
                          children: [
                            Text(
                              chatModel.name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            if (chatModel.isPro)
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  "Pro",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                    fontFamily: AppTheme.dmMono,
                                    letterSpacing: -1,
                                  ),
                                ),
                              ),
                            if (chatModel.isMax)
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.red.shade200,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  "Max",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontFamily: AppTheme.dmMono,
                                    letterSpacing: -1,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        subtitle: Text(
                          chatModel.description,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: ModelProvider.values
                        .map(
                          (provider) => IconButton(
                            onPressed: () {
                              setState(() {
                                this.provider = provider;
                              });
                            },
                            icon: SvgPicture.asset(
                              provider.icon,
                              width: 24,
                              height: 24,
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                provider == this.provider
                                    ? Colors.black
                                    : Colors.grey.shade400,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
