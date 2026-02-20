import 'package:chatbot/core/theme/app_color.dart';
import 'package:chatbot/core/theme/app_style.dart';
import 'package:chatbot/feature/chat/data/models/chat_message_model.dart';
import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({
    super.key,
    required this.chatMessage,
  });

  final ChatMessageModel chatMessage;

  bool get isCurrentUser => chatMessage.role == 'user';
  String get message => chatMessage.parts?.first.text ?? '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        isCurrentUser ? 64.0 : 16.0,
        4,
        isCurrentUser ? 16.0 : 64.0,
        4,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isCurrentUser) _buildAvatar() else const SizedBox(),
          const SizedBox(width: 7),
          Flexible(
            child: DecoratedBox(
              decoration: ShapeDecoration(
                color: isCurrentUser
                    ? AppColor.primaryColor
                    : const Color(0xffF4F4F4),
                shape: RoundedRectangleBorder(
                  borderRadius: _borderRadius(),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 18,
                ),
                child: Text(
                  message,
                  style: AppStyles.styleBold13().copyWith(
                    color: isCurrentUser ? AppColor.white : AppColor.grey,
                  ),
                ),
              ),
            ),
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

  BorderRadius _borderRadius() {
    return isCurrentUser
        ? const BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )
        : const BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          );
  }
}
