import 'package:aichat/src/core/enums/model_provider.dart';
import 'package:aichat/src/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ModelPickerBottomSheet extends StatefulWidget {
  const ModelPickerBottomSheet({super.key});

  @override
  State<ModelPickerBottomSheet> createState() => _ModelPickerBottomSheetState();
}

class _ModelPickerBottomSheetState extends State<ModelPickerBottomSheet> {
  ModelProvider provider = ModelProvider.openai;

  @override
  Widget build(BuildContext context) {
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
          provider.label,
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
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {},
                    splashColor: Colors.transparent,
                    tileColor: Colors.grey.shade100,
                    shape: RoundedSuperellipseBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(26),
                      ),
                    ),
                    title: Row(
                      children: [
                        Text(
                          "GPT 5.3 Instant",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
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
                      ],
                    ),
                    subtitle: Text(
                      "OpenAI's latest chat-optimized LLM",
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
  }
}
