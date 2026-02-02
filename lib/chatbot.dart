import 'package:chatbot/core/routes/app_router.dart';
import 'package:chatbot/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class Chatbot extends StatelessWidget {
  const Chatbot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.routes,
      debugShowCheckedModeBanner: false,
      title: 'Chatbot',
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,


      
    );
  }
}