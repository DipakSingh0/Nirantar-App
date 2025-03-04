import 'package:nira/imports.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    var theme = Theme.of(context);
    final loginController = LoginController(
      context: context,
      emailController: emailController,
      passwordController: passwordController,
    );

    return Column(
      children: [
        // Email TextField
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            fillColor: Colors.grey.shade100,
            filled: true,
            hintText: 'Email',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          style: TextStyle(color: theme.colorScheme.onPrimary),
        ),
        const SizedBox(height: 18),

        // Password TextField
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
            fillColor: Colors.grey.shade100,
            filled: true,
            hintText: 'Password',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          obscureText: true,
          style: TextStyle(color: theme.colorScheme.onPrimary),

        ),
        const SizedBox(height: 15),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                color: Color(0xff4c505b),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: const Color(0xff4c505b),
              child: IconButton(
                color: Colors.white,
                onPressed: loginController.signIn,
                icon: const Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
