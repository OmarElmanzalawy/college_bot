import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomStack extends StatelessWidget {
  final String question;

  CustomStack({required this.question});

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
              image: DecorationImage(image: AssetImage('images/gradient.jpg'),fit: BoxFit.fill),
              color: Colors.grey.withOpacity(0.2),
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
                          child: Text(question),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
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
