import 'package:nira/imports.dart';

class LogoutController {
  final BuildContext context;

  LogoutController({required this.context});

  Future<void> signOut() async {
    try {
      // Perform the sign-out operation
      await FirebaseAuth.instance.signOut();

      // Show success SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Successfully logged out!'),
          duration: Duration(seconds: 2),
        ),
      );

      // Navigate back to the LoginPage after a successful sign-out
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false,
      );
    } catch (e) {
      // Show error message using SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred during logout: \$e'),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
