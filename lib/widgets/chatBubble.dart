import 'package:auto_size_text/auto_size_text.dart';
import 'package:college_bot/constants.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final MessageSender sender;

  ChatBubble({required this.text, required this.sender});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: sender == MessageSender.user
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Expanded(
          child: Container(
            constraints:
                BoxConstraints(minWidth: 200, minHeight: 75, maxWidth: 230),
            decoration: BoxDecoration(
              borderRadius: sender == MessageSender.user
                  ? BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(0))
                  : BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(15)),
              color: sender == MessageSender.user
                  ? kblueTextColor
                  : Colors.grey.shade200,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                text,
                style: TextStyle(
                    color: sender == MessageSender.user
                        ? Colors.white
                        : Colors.black,
                    fontSize: 15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
