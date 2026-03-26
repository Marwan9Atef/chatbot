import 'package:chatbot/core/theme/app_color.dart';
import 'package:chatbot/core/theme/app_style.dart';
import 'package:flutter/material.dart';

class FailureChatMessageBubbleWidget extends StatelessWidget {
  const FailureChatMessageBubbleWidget({
    super.key,
    required this.lastSentMessage,
    required this.errorMessage,
    this.onResend,
  });

  final String lastSentMessage;
  final String errorMessage;
  final VoidCallback? onResend;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(64, 4, 16, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          DecoratedBox(
            decoration: ShapeDecoration(
              color: Colors.red.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                side: BorderSide(color: Colors.red.shade300, width: 1),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    lastSentMessage,
                    style: AppStyles.styleBold13().copyWith(
                      color: AppColor.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    errorMessage,
                    style: AppStyles.styleBold13().copyWith(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (onResend != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: IconButton(
                onPressed: onResend,
                icon: const Icon(Icons.refresh, color: AppColor.primaryColor),
                iconSize: 20,
              ),
            ),
        ],
      ),
    );
  }
}
