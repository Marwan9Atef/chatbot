import 'package:chatbot/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typing_indicator/flutter_typing_indicator.dart';

class LoadingChatMessageBubbleWidget extends StatelessWidget {
  const LoadingChatMessageBubbleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 64, 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildAvatar(),
          const SizedBox(width: 7),
          TypingIndicator(
            dotColor: AppColor.grey,
            backgroundColor: Colors.white,
            dotSize: 8.0,
            dotCount: 3,
            duration: Duration(milliseconds: 1500),
            padding: 12.0,
            dotShape: BoxShape.circle,
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            dotShadow: [BoxShadow(blurRadius: 2, color: AppColor.mostBlack)],
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return DecoratedBox(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(245.28),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 1.96,
            offset: Offset(0, 1.96),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
        child: Image.asset(
          'assets/images/robot.png',
          width: 11,
          height: 17,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
