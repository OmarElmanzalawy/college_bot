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
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:140.0,bottom: 30),
              child: Text('Get Started',
              style: TextStyle(
                color: kblueTextColor,
                fontSize: 30
              ),
              ),
            ),
            TitledTextField(
              title: 'Email'
            , hint: 'Enter your student email',
            suffixIcon: Icon(Icons.email),
            ),
            TitledTextField(
              title: 'Name'
            , hint: 'Enter your full name',
            suffixIcon: Icon(Icons.badge),
            ),
            TitledTextField(
              title: 'Password'
            , hint: 'Enter your password',
            suffixIcon: Icon(Icons.lock),
            ),
              TitledTextField(
              title: 'Student ID'
            , hint: 'Enter your student ID',
            suffixIcon: Icon(Icons.fingerprint),
            ),
            Padding(
              padding: const EdgeInsets.only(top:65.0),
              child: ActionButton(text: 'SignUp',backgroundColor: Colors.blue,textColor: Colors.white,
              onpressed: ()=> Navigator.pushNamed(context, '/dashboard'),
              ),
            )
          ]
    )
    );
  
  }
}
