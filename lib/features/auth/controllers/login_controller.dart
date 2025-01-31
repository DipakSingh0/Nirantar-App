import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nira/features/core/home/home_page.dart';

class LoginController {
  final BuildContext context;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  LoginController({
    required this.context,
    required this.emailController,
    required this.passwordController,
  });

  Future<void> signIn() async {
    try {
      // Perform the sign-in operation
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Show success SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Successfully logged in!'),
          duration: Duration(seconds: 2),
        ),
      );

      // Navigate to HomePage after a successful sign-in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'user-not-found':
          message = 'This email is not registered';
          break;
        case 'wrong-password':
          message = 'Incorrect password';
          break;
        case 'invalid-email':
          message = 'Invalid email format';
          break;
        default:
          message = 'An error occurred. Please try again.';
      }

      // Show error message using SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
