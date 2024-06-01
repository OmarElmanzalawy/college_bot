import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  static Future<String> register({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      print('firebase exception');
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return 'Password is too weak';
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return 'An account already exists for that email';
      } else if (e.code == 'invalid-email') {
        print('Invalid Email');
        return 'Invalid Email';
      } else {
        print('Code: ${e.code}');
        print(e.message);
        return e.code;
      }
    } catch (e) {
      print('Other type of error');
      print(e.toString());
      return 'Error Occured';
    }
  }

  static Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong Password';
      } else if (e.code == 'invalid-email') {
        return 'Invalid Email';
      } else if (e.code == 'wrong-password') {
        return 'Wrong Password';
      } else if (e.code == 'too-many-requests') {
        return 'Stop Spamming!';
      } else {
        print('Code: ${e.code}');
        return 'Error code: ${e.code}';
      }
    } catch (e) {
      return e.toString();
    }
  }

  static void forgetpassword(BuildContext context, String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
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
              message: 'This email is not associated with any accounts',
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
  }

  static void verifyEmail(BuildContext context) async {
    try {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'too-many-requests') {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Already Sent',
              message: 'An email has already been sent to you',
              contentType: ContentType.failure,
            ),
          ));
      }
    }
    Navigator.pop(context, 'Send');
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Check your email!',
          message: 'Verification link has been sent to your email.',
          contentType: ContentType.success,
          color: Colors.lightBlue,
        ),
      ));
  }

  static void logout(BuildContext context) async {
    //TODO: IMPLEMENT LOGOUT FUNCTIONALITY
    await FirebaseAuth.instance.signOut();
    //TODO DISPLAY SNACK BAR OR LOADING INDICATOR UNTILL LOGOUT IS COMPLETED
    Navigator.pushReplacementNamed(context, '/signin');
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Logout Successful',
          message: '',
          messageFontSize: 0,
          contentType: ContentType.success,
          color: Colors.lightBlue,
        ),
      ));
  }
}
