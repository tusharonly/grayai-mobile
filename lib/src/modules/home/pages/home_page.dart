import 'package:aichat/src/core/theme/theme.dart';
import 'package:aichat/src/modules/chat/pages/chat_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedMenu02,
            color: Colors.black,
          ),
        ),
        title: Text.rich(
          TextSpan(
            style: TextStyle(
              fontFamily: AppTheme.dmMono,
              letterSpacing: -1.5,
            ),
            children: [
              TextSpan(text: 'grey'),
              TextSpan(
                text: 'ai',
                style: TextStyle(color: Color(0xFFD2D2D2)),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  onTap: () {},
                  splashColor: Colors.transparent,
                  tileColor: Colors.grey.shade100,
                  shape: RoundedSuperellipseBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(26),
                    ),
                  ),
                  title: Text(
                    "Friday, 20 March",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  subtitle: Text(
                    "Connecting controller to PS5",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CupertinoButton.tinted(
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => ChatPage(),
              fullscreenDialog: true,
            ),
          );
        },
        color: Colors.grey,
        borderRadius: BorderRadius.circular(40),
        child: HugeIcon(
          icon: HugeIcons.strokeRoundedAdd01,
          color: Colors.black,
        ),
      ),
    );
  }
}
