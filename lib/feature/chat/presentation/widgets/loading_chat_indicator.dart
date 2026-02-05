import 'package:chatbot/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typing_indicator/flutter_typing_indicator.dart';

class LoadingChatIndicator extends StatelessWidget {
  const LoadingChatIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return TypingIndicator(
       dotColor: AppColor.grey,
            backgroundColor: Colors.white,
            dotSize: 8.0,
            dotCount: 3,
            duration: Duration(milliseconds: 1500),
            padding: 12.0,
            dotShape: BoxShape.circle,
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            dotShadow: [BoxShadow(blurRadius: 2, color: AppColor.mostBlack)],
         



    );
  }
}