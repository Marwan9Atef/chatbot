import 'package:chatbot/core/theme/app_color.dart';
import 'package:chatbot/core/theme/app_style.dart';
import 'package:chatbot/feature/chat/data/models/chat_model.dart';
import 'package:chatbot/feature/chat/presentation/cubit/chat_cubit.dart';
import 'package:chatbot/feature/chat/presentation/widgets/error_indicator.dart';
import 'package:chatbot/feature/chat/presentation/widgets/loading_chat_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({
    super.key,
    required this.message,
    this.isLoading = false,
    this.isfail = false,
    this.failText=""
  });
  final ChatModel message;
  final bool isLoading;
  final bool isfail;
  final String failText;

  @override
  Widget build(BuildContext context) {

    final bool isCurrentUser = message.sender == Sender.user;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        isCurrentUser ? 64.0 : 16.0,
        4,
        isCurrentUser ? 16.0 : 64.0,
        4,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: isCurrentUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          !isCurrentUser
              ? DecoratedBox(
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(245.28),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x0C000000),
                        blurRadius: 1.96,
                        offset: Offset(0, 1.96),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 4,
                    ),
                    child: Image.asset(
                      'assets/images/robot.png',
                      width: 11,
                      height: 17,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                )
              : const SizedBox(),
          const SizedBox(width: 7),
          Flexible(
            child: isLoading
                ? LoadingChatIndicator()
                : DecoratedBox(
                    decoration: ShapeDecoration(
                      color: isCurrentUser
                          ? AppColor.primaryColor
                          : const Color(0xffF4F4F4),
                      shape: RoundedRectangleBorder(
                        borderRadius: borderDirection(),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 18,
                      ),
                      child:isfail ? ErrorIndicator(
                        prefText: failText,
                        onTap: () {
                          context.read<ChatCubit>().sendUserMessage(message.message);
                        },
                      ) : ChatText(
                        message: message,
                        isCurrentUser: isCurrentUser,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  BorderRadius borderDirection() {
    return message.sender == Sender.user
        ? BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )
        : BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          );
  }
}

class ChatText extends StatelessWidget {
  const ChatText({
    super.key,
    required this.message,
    required this.isCurrentUser,
  });

  final ChatModel message;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Text(
      message.message,
      style: AppStyles.styleBold13().copyWith(
        color: isCurrentUser ? AppColor.white : AppColor.grey,
      ),
    );
  }
}
