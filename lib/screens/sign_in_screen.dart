import 'dart:math';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:college_bot/curves/customCurvedEdge.dart';
import 'package:college_bot/widgets/actionButton.dart';
import 'package:college_bot/widgets/titledTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:college_bot/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:college_bot/backend/userAuth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;
  bool finishedLoading = false;
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                    'Sign In',
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
              hint: 'Enter your email',
              suffixIcon: Icon(Icons.fingerprint),
            ),
            TitledTextField(
              title: 'Password',
              controller: _passwordController,
              hint: 'Enter your password',
              suffixIcon: Icon(Icons.lock),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 15),
              child: Row(
                children: [
                  Text(
                    'Remember me',
                    style: TextStyle(
                      color: ksubtitleColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  Checkbox(
                    value: ischecked,
                    onChanged: (bool? value) {
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
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/forgetpassword');
                      },
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 55.0, bottom: 15),
              child: ActionButton(
                textColor: Colors.white,
                text: 'Login',
                onpressed: () async {
                  var loginResponse = await AuthService.login(
                      email: _emailController.text,
                      password: _passwordController.text);
                  print(loginResponse.toString());
                  if (loginResponse == 'Success') {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: 'Login Successful',
                          message: '',
                          messageFontSize: 0,
                          contentType: ContentType.success,
                          color: Colors.lightBlue,
                        ),
                      ));
                    setState(() {
                      print('Login Successfully');
                      Navigator.pushNamed(
                        context,
                        '/dashboard',
                      );
                    });
                  } else if (loginResponse == '') {
                  } else {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                            title: loginResponse! ?? 'Error',
                            message: '',
                            messageFontSize: 0,
                            contentType: ContentType.failure),
                      ));
                    print('Login Failed');
                  }
                },
              ),
            ),
            //Text('OR',style: TextStyle(fontSize: 25,color: kblueTextColor,fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: ActionButton(
                textColor: Colors.white,
                text: 'Signup',
                onpressed: () => {
                  Navigator.pushNamed(context, '/signup'),
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
