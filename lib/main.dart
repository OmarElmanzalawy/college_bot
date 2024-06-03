import 'package:college_bot/firebase_options.dart';
import 'package:college_bot/screens/chat_screen.dart';
import 'package:college_bot/screens/dashboard.dart';
import 'package:college_bot/screens/forget_password.dart';
import 'package:college_bot/screens/profile_screen.dart';
import 'package:college_bot/screens/sign_in_screen.dart';
import 'package:college_bot/screens/signup_screen.dart';
import 'package:college_bot/screens/voice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:college_bot/screens/splash_screen.dart';
import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print('firebase initialized');

  var auth = FirebaseAuth.instance.authStateChanges().listen((User? user) {
    print('User: $user');

    if (user == null) {
      print('User is currently signed out');
    } else {
      print('User is signed in');
    }
  });

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final List<String> imageUrls = [
    'images/robot-c.png',
    'images/profile_female.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    imageUrls.forEach((element) {
      precacheImage(AssetImage(element), context);
    });

    return MaterialApp(
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? '/splash'
          : '/dashboard',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/signin': (context) => const SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/chat': (context) => const ChatScreen(),
        '/voice': (context) => const VoiceScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/forgetpassword': (context) => const ForgetPasswordScreen(),
      },
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: kdefaultBackgroundColor,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          dialogTheme: DialogTheme(
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            iconColor: Colors.blue,
          ),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                  textStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold)))),
    );
  }
}
