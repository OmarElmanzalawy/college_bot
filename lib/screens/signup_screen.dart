import 'dart:math';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:college_bot/backend/userAuth.dart';
import 'package:college_bot/curves/customCurvedEdge.dart';
import 'package:college_bot/widgets/actionButton.dart';
import 'package:college_bot/widgets/titledTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:college_bot/constants.dart';
import 'package:flutter/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
              controller: _emailController,
              hint: 'Enter your student email',
              suffixIcon: Icon(Icons.email),
            ),
            TitledTextField(
              title: 'Name',
              controller: _nameController,
              hint: 'Enter your full name',
              suffixIcon: Icon(Icons.badge),
            ),
            TitledTextField(
              title: 'Password',
              controller: _passwordController,
              hint: 'Enter your password',
              suffixIcon: Icon(Icons.lock),
            ),
            TitledTextField(
              title: 'Student ID',
              controller: _idController,
              hint: 'Enter your student ID',
              suffixIcon: Icon(Icons.fingerprint),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: ActionButton(
                text: 'SignUp',
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                onpressed: () async {
                  var signupResponse = await AuthService.register(
                      email: _emailController.text,
                      password: _passwordController.text);
                  if (signupResponse == 'Success') {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: 'Signup Successful',
                          message: '',
                          messageFontSize: 0,
                          contentType: ContentType.success,
                          color: Colors.lightBlue,
                        ),
                      ));
                    print('Name Textfield: ${_nameController.text}');
                    await FirebaseAuth.instance.currentUser!
                        .updateDisplayName(_nameController.text);
                    Navigator.pushNamed(context, '/dashboard');
                  } else {
                    //TODO: DISPLAY SNACKBAR
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                            title: signupResponse,
                            message: '',
                            messageFontSize: 0,
                            contentType: ContentType.failure),
                      ));
                    print('Signup failed');
                  }
                },
              ),
            )
          ]),
        ));
  }
}
