import 'package:aichat/src/core/theme/theme.dart';
import 'package:aichat/src/modules/home/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GreyAI extends StatelessWidget {
  const GreyAI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gray AI",
      theme: AppTheme.light,
      scrollBehavior: CupertinoScrollBehavior(),
      home: HomePage(),
    );
  }
}
