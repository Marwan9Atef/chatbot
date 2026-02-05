import 'package:chatbot/core/di/service_locator.dart';
import 'package:chatbot/core/routes/route_center.dart';
import 'package:chatbot/feature/chat/presentation/cubit/chat_cubit.dart';
import 'package:chatbot/feature/chat/presentation/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final routes = GoRouter(
      routes: [
        GoRoute(
          path: RouteCenter.chat,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: BlocProvider(
                create: (context) => serviceLocator.get<ChatCubit>(),
                child: const ChatScreen()),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                  FadeTransition(opacity: animation, child: child),
            );
          },
        ),

        // GoRoute(
        //   path: RouteCenter.chat,
        //   pageBuilder: (context, state) {
        //     return CustomTransitionPage(
        //       child: const ChatScreen(),
        //       transitionsBuilder:
        //           (context, animation, secondaryAnimation, child) =>
        //           FadeTransition(opacity: animation, child: child),
        //     );
        //   },
        // ),
      ]
    );
}