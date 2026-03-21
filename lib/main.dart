import 'package:aichat/src/app.dart';
import 'package:aichat/src/core/providers/models_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ModelsProvider()..initialize(),
          lazy: false,
        ),
      ],
      child: const GreyAI(),
    ),
  );
}
