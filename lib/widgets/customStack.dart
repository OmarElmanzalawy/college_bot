import 'dart:ffi';
import 'dart:ui';
import 'package:college_bot/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:typewritertext/typewritertext.dart';

class CustomStack extends StatefulWidget {
  final String question;
  final String answer;


  CustomStack({required this.question,required this.answer});

  @override
  State<CustomStack> createState() => _CustomStackState();
}

class _CustomStackState extends State<CustomStack> with SingleTickerProviderStateMixin {
  double answerOpacity = 0;
  late AnimationController _controller;

  //TODO FINISH SHOWANSWER FUNCTIONALITY


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  
  @override
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
                filter: ImageFilter.blur(sigmaX: 30,sigmaY: 30),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 12),
                      child: Container(
                        width: 330,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0, top: 12),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: Text(widget.question,style: TextStyle(
                                ),),
                              ),
                              Divider(thickness: 3,indent: 35,endIndent: 35,),
                               AnimatedOpacity(
                                opacity: answerOpacity,
                                duration: Duration(milliseconds: 50),
                                //TODO: IMPLEMENT TYPEWRITER TEXT 
                                 child: Text(
                                  widget.answer,
                                  ),
                               ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if(answerOpacity==0){
                            answerOpacity=1;

                          }
                        });
                        
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          foregroundColor: MaterialStateProperty.all(Colors.white)),
                      child: Text('Show Answer',style: TextStyle(color: Colors.black87),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            iconSize: 17,
                            onPressed: () {},
                            icon: Icon(Icons.chat_bubble,color: Colors.white,)),
                        Text(
                          'Chat',
                          style: TextStyle(fontSize: 15,color: Colors.white),
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
