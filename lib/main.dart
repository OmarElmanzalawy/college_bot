import 'package:college_bot/screens/dashboard.dart';
import 'package:college_bot/screens/sign_in_screen.dart';
import 'package:college_bot/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:college_bot/screens/splash_screen.dart';
import 'constants.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      initialRoute: '/dashboard',

      routes: {
        '/splash':(context) => SplashScreen(),
        '/signin':(context) => const SignInScreen(),
        '/signup':(context) => const SignUpScreen(),
        '/dashboard':(context) => DashboardScreen(),
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.lightBlue.shade50,

      ),
    );
  }
}