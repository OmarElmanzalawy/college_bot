import 'package:auto_size_text/auto_size_text.dart';
import 'package:college_bot/constants.dart';
import 'package:college_bot/widgets/chatBubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //7extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 160,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: kbuttonGradient,
                border: Border.all(color: Colors.yellow, width: 4),
                image: DecorationImage(
                    image: AssetImage(
                      'images/chat_robot.png',
                    ),
                    fit: BoxFit.cover)),
          ),
          centerTitle: true,
          actions: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
              ),
              child: IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
            )
          ],
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 8, right: 8),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      //padding: EdgeInsets.all(8),
                      //reverse: false,
                      children: [
                        ChatBubble(
                            text: 'What is a dual degree program?',
                            sender: MessageSender.user),
                        ChatBubble(
                            text:
                                'A dual degree program is an academic program that allows a student to earn two different degrees simultaneously, typically from two separate academic disciplines or fields of study. These programs are designed to provide a more comprehensive education by combining courses from both degree programs, often resulting in a broader skill set and enhanced career opportunities.',
                            sender: MessageSender.ai),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                        suffixIcon: Icon(Icons.attachment),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        //labelText: 'Student ID',
                        hintText: 'Ask anything...',
                        //suffixIcon: Icon(Icons),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
