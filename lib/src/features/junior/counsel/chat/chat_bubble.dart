import 'package:flutter/material.dart';
import 'package:seenear/core/extension/context_extension.dart';
import 'package:seenear/src/constants/colors.dart';
import 'package:seenear/src/constants/fonts.dart';

class CustomSeniorChatBubble extends StatelessWidget {
  final BuildContext context;
  final String message;
  final bool isFirstChat;

  const CustomSeniorChatBubble(
      {required this.context,
      required this.message,
      required this.isFirstChat,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 5),
      constraints: BoxConstraints(maxWidth: context.width * 0.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: isFirstChat
                ? const Radius.circular(0)
                : const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomRight: const Radius.circular(20),
            bottomLeft: const Radius.circular(20)),
        color: ColorSystem.orange,
      ),
      child: Text(
        message,
        style: FontSystem.caption,
        softWrap: true,
      ),
    );
  }
}

class CustomJuniorChatBubble extends StatelessWidget {
  final BuildContext context;
  final String message;

  const CustomJuniorChatBubble(
      {required this.context, required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 5),
      constraints: BoxConstraints(maxWidth: context.width * 0.5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20)),
        border: Border.all(color: ColorSystem.orange),
        color: ColorSystem.white,
      ),
      child: Text(
        message,
        style: FontSystem.caption,
      ),
    );
  }
}
