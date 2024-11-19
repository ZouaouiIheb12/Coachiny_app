import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  bool isLoading = false;

  String? emailError;
  String? passwordError;

  void setEmail(String value) {
    email = value;
    emailError = null;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    passwordError = null;
    notifyListeners();
  }

  bool validateInputs() {
    emailError = email.isEmpty || !email.contains('@') ? 'Invalid email' : null;
    passwordError = password.isEmpty ? 'Password required' : null;
    notifyListeners();
    return emailError == null && passwordError == null;
  }

  Future<void> login(BuildContext context) async {
    if (!validateInputs()) return;

    isLoading = true;
    notifyListeners();

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Login failed')),
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
