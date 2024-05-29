import 'package:firebase_auth/firebase_auth.dart';

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
}
