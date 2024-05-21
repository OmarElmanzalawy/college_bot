import 'dart:ffi';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:college_bot/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:typewritertext/typewritertext.dart';

class CustomStack extends StatefulWidget {
  final String question;
  final String answer;

  CustomStack({required this.question, required this.answer});

  @override
  State<CustomStack> createState() => _CustomStackState();
}

class _CustomStackState extends State<CustomStack>
    with SingleTickerProviderStateMixin {
  double answerOpacity = 0;
  late AnimationController _controller;
  late TypeWriterController _typeWriterController;
  //TODO FINISH SHOWANSWER FUNCTIONALITY

  @override
  void initState() {
    super.initState();
    /*_controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));*/
    _typeWriterController = TypeWriterController(
        text: widget.answer, duration: Duration(milliseconds: 100));
    /*_typeWriterController.addListener(() {
      setState(() {
        print(_typeWriterController.value);
      });
    });*/
    //_typeWriterController.stop();
  }

  @override
  String btnText = 'Show Answer';

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 22),
      child: Stack(
        children: [
          Container(
            width: 380,
            height: 300,
            decoration: BoxDecoration(
                //image: DecorationImage(image: AssetImage('images/chatbot.jpg'),fit: BoxFit.fill),
                gradient: kbuttonGradient,
                //color: Colors.grey.withOpacity(0.2),
                //gradient: LinearGradient(colors: [Colors.lightBlue.shade700,Colors.lightBlue.shade400],begin: Alignment.bottomLeft,end: Alignment.topRight),
                borderRadius: BorderRadius.circular(15)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 12),
                      child: Container(
                        //width: 330,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.transparent),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0, top: 5),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: Text(
                                  widget.question,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Divider(
                                thickness: 3,
                                color: Colors.white,
                              ),
                              AnimatedOpacity(
                                opacity: answerOpacity,
                                duration: Duration(milliseconds: 50),
                                child: TypeWriter(
                                  enabled: false,
                                  controller: _typeWriterController,
                                  builder: (p0, value) {
                                    return AutoSizeText(
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                      value.text,
                                      maxLines: 5,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //SHOW ANSWER BUTTON IMPLEMENTATION
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (answerOpacity == 0) {
                            _typeWriterController.start();
                            answerOpacity = 1;
                            btnText = 'Hide Answer';
                          } else {
                            btnText = 'Show Answer';
                            answerOpacity = 0;
                            //_typeWriterController.
                          }
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      child: Text(
                        btnText,
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            iconSize: 17,
                            onPressed: () {},
                            icon: Icon(
                              Icons.chat_bubble,
                              color: Colors.white,
                            )),
                        Text(
                          'Chat',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//TODO: MAKE ANIMATION RESTART WHEN ANSWER IS SHOWED FOR SECOND TIME
