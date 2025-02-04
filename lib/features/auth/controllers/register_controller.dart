// ignore_for_file: use_build_context_synchronously


import 'package:nira/imports.dart';

class RegisterController {
  final BuildContext context;
  final TextEditingController hospitalIdController;
  final TextEditingController hospitalNameController;
  final TextEditingController registrationNumberController;
  final TextEditingController emailController;
  final TextEditingController contactPersonController;
  final TextEditingController phoneNumberController;
  final TextEditingController addressController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  RegisterController({
    required this.context,
    required this.hospitalIdController,
    required this.hospitalNameController,
    required this.registrationNumberController,
    required this.emailController,
    required this.contactPersonController,
    required this.phoneNumberController,
    required this.addressController,
    required this.passwordController,
    required this.confirmPasswordController,
  });
  Future<void> signUp() async {
  // Check if passwords match
  if (passwordController.text.trim() != confirmPasswordController.text.trim()) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Passwords do not match'),
        duration: Duration(seconds: 3),
      ),
    );
    return;
  }

  try {
    // Create a new user with Firebase Authentication
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    // Save additional hospital information to Firestore
    await FirebaseFirestore.instance
        .collection('hospitals')
        .doc(userCredential.user?.uid)
        .set({
      'hospitalId': hospitalIdController.text.trim(),
      'hospitalName': hospitalNameController.text.trim(),
      'registrationNumber': registrationNumberController.text.trim(),
      'contactPerson': contactPersonController.text.trim(),
      'phoneNumber': phoneNumberController.text.trim(),
      'address': addressController.text.trim(),
      'email': emailController.text.trim(),
      'createdAt': FieldValue.serverTimestamp(),
    });

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Registration successful! Please log in.'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.green,
      ),
    );

    // Navigate to the LoginPage after successful registration
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  } on FirebaseAuthException catch (e) {
    // Handle specific Firebase authentication errors
    String message;
    switch (e.code) {
      case 'email-already-in-use':
        message = 'This email is already registered';
        break;
      case 'weak-password':
        message = 'Password should be at least 6 characters';
        break;
      case 'invalid-email':
        message = 'Invalid email format';
        break;
      default:
        message = 'An error occurred. Please try again.';
    }

    // Show error message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  } catch (e) {
    // Log any unexpected errors
    // ignore: avoid_print
    print('Error during registration: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Failed to register. Please try again.'),
      ),
    );
  }
}
}