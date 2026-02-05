import 'package:chatbot/core/theme/app_color.dart';
import 'package:chatbot/core/theme/app_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({super.key,required this.prefText,required this.onTap});
  final String prefText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: prefText,
          style: AppStyles.styleBold13().copyWith(
            color: Colors.red,
          ),
          children: [
            TextSpan(
              text: " Retry",
              style: AppStyles.styleBold13().copyWith(
                color: AppColor.primaryColor,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}