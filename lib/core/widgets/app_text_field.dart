import 'package:chatbot/core/theme/app_color.dart';
import 'package:chatbot/core/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.onSend,
    this.onMicrophoneTap,
    this.hintText = 'Write your message',
  });

  final TextEditingController? controller;
  final VoidCallback? onSend;
  final VoidCallback? onMicrophoneTap;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(right: 16),

            margin: const EdgeInsets.symmetric(horizontal: 24),

            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: const Color(0xFFE8E8E8), width: 1),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: AppStyles.styleBold13().copyWith(
                        color: const Color(0xFFB0B0B0),
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 22,
                      ),
                    ),
                    style: AppStyles.styleBold13().copyWith(
                      color: AppColor.mostBlack,
                    ),
                  ),
                ),
                // Microphone button
                GestureDetector(
                  onTap: onMicrophoneTap,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SvgPicture.asset("assets/images/mice.svg"),
                  ),
                ),
                // Send button
                InkWell(
                  onTap: onSend,
                  child: SvgPicture.asset("assets/images/send.svg"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
