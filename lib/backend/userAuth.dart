import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static Future<bool> register({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      print('firebase exception');
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return false;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return false;
      } else if (e.code == 'invalid-email') {
        print('Invalid Email');
        return false;
      } else {
        print('Code: ${e.code}');
        print(e.message);
        return false;
      }
    } catch (e) {
      print('Other type of error');
      print(e.toString());
      return false;
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
        return 'Wrong password provided for that user.';
      } else {
        print('Code: ${e.code}');
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }
}
