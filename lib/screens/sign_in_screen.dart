import 'package:college_bot/widgets/actionButton.dart';
import 'package:college_bot/widgets/titledTextField.dart';
import 'package:flutter/material.dart';
import 'package:college_bot/constants.dart';
import 'package:flutter/widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(    
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:140.0,bottom: 50),
              child: Text('Sign In',
              style: TextStyle(
                color: kblueTextColor,
                fontSize: 35
              ),
              ),
            ),
            TitledTextField(
              title: 'Student Id'
            , hint: 'Enter your student ID',
            suffixIcon: Icon(Icons.fingerprint),
            ),
            TitledTextField(
              title: 'Password'
            , hint: 'Enter your password',
            suffixIcon: Icon(Icons.lock),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,top: 15),
              child: Row(
                children: [
                  Text('Remember me',style: TextStyle(
                    color: ksubtitleColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,

                  ),),
                  Checkbox(
                    value: ischecked, onChanged:(bool? value){
                    setState(() {
                      ischecked = value!;
                    });
                  },
                  checkColor: Colors.white,
                  //fillColor: MaterialStateProperty.all(Colors.blue),
                  activeColor: Colors.blue,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 155.0),
                    child: Text('Forgot Password',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w500),),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 55.0,bottom: 15),
              child: ActionButton(textColor: Colors.white,text: 'Login',onpressed: (){
                Navigator.pushNamed(context, '/dashboard');
              },
              ),
            ),
            //Text('OR',style: TextStyle(fontSize: 25,color: kblueTextColor,fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.only(top:15.0),
              child: ActionButton(
                textColor: Colors.white,
                text: 'Signup',
                onpressed: () => Navigator.pushNamed(context, '/signup'),
                ),
            )
          ],
        ),
    );
  }
}