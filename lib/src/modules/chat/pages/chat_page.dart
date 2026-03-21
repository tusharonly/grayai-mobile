import 'package:aichat/src/core/models/chat_model.dart';
import 'package:aichat/src/core/theme/theme.dart';
import 'package:aichat/src/widgets/pickers/model_picker_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ChatModel? selectedChatModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedCancel01,
            color: Colors.black,
          ),
        ),
        title: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.grey.shade100,
          onTap: () async {
            final chatModel = await showModalBottomSheet<ChatModel?>(
              context: context,
              isScrollControlled: true,
              shape: RoundedSuperellipseBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(36),
                ),
              ),

              builder: (context) => ModelPickerBottomSheet(
                selectedChatModel: selectedChatModel,
              ),
            );
            if (chatModel != null) {
              setState(() => selectedChatModel = chatModel);
            }
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "${selectedChatModel?.name}",
              style: TextStyle(
                fontFamily: AppTheme.dmMono,
                letterSpacing: -1,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
