import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
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
        backgroundColor: kblueHeaderColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: kblueHeaderColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              padding: const EdgeInsets.only(top: 12.0),
              child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: _emailController.text);
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            title: 'Email Sent!',
                            message: 'Check your inbox',
                            messageFontSize: 10,
                            contentType: ContentType.success,
                            color: Colors.lightBlue,
                          ),
                        ));
                      Navigator.pop(context);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(SnackBar(
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: 'User not found',
                              message:
                                  'This email is not associated with any accounts',
                              messageFontSize: 10,
                              contentType: ContentType.failure,
                            ),
                          ));
                      } else if (e.code == 'invalid-email') {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(SnackBar(
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: 'Invalid email',
                              message: '',
                              messageFontSize: 0,
                              contentType: ContentType.failure,
                            ),
                          ));
                      } else {
                        print('error catched: ${e.message}');
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(SnackBar(
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: 'Error Occured',
                              message: '',
                              messageFontSize: 0,
                              contentType: ContentType.failure,
                            ),
                          ));
                      }
                    }
                  },
                  child: Text('Send Email')),
            )
          ],
        ),
      ),
    );
  }
}
