import 'dart:math';

import 'package:college_bot/curves/customCurvedEdge.dart';
import 'package:college_bot/widgets/actionButton.dart';
import 'package:college_bot/widgets/titledTextField.dart';
import 'package:flutter/material.dart';
import 'package:college_bot/constants.dart';
import 'package:flutter/widgets.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Stack(children: [
            ClipPath(
              clipper: CustomCurvedEdge(),
              child: Container(
                height: 300,
                padding: EdgeInsets.all(0),
                color: kblueHeaderColor,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 120.0),
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
            ),
            Positioned(
                right: 255,
                top: 100,
                child: Transform.rotate(
                  angle: pi / 12,
                  child: Image(
                    image: AssetImage('images/robot-c.png'),
                    height: 250,
                  ),
                )),
          ]),
          TitledTextField(
            title: 'Email',
            hint: 'Enter your student email',
            suffixIcon: Icon(Icons.email),
          ),
          TitledTextField(
            title: 'Name',
            hint: 'Enter your full name',
            suffixIcon: Icon(Icons.badge),
          ),
          TitledTextField(
            title: 'Password',
            hint: 'Enter your password',
            suffixIcon: Icon(Icons.lock),
          ),
          TitledTextField(
            title: 'Student ID',
            hint: 'Enter your student ID',
            suffixIcon: Icon(Icons.fingerprint),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: ActionButton(
              text: 'SignUp',
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              onpressed: () => Navigator.pushNamed(context, '/dashboard'),
            ),
          )
        ]));
  }
}
