import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:college_bot/backend/userAuth.dart';
import 'package:college_bot/constants.dart';
import 'package:college_bot/widgets/actionButton.dart';
import 'package:college_bot/widgets/titledTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: kblueHeaderColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 350,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/lock.png'),
                      fit: BoxFit.contain)),
            ),
            Text(
              'Enter your email and we will send you a password reset link',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            TitledTextField(
                hint: 'Enter your email', controller: _emailController),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: ElevatedButton(
                onPressed: () async {
                  AuthService.forgetpassword(context, _emailController.text);
                },
                child: Text('Send Email'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.white,
                    ),
                    foregroundColor: MaterialStateProperty.all(Colors.black)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
