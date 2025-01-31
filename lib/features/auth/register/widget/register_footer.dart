import 'package:nira/widgets/imports.dart';

class RegisterFooter extends StatelessWidget {
  const RegisterFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed:
              //  signUp,
              () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          child: const Text(
            'Sign In',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 18,
              color: Color(0xff4c505b),
            ),
          ),
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ForgotPasswordPage()));
            },
            child: const Text(
              'Forgot Password',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 18,
                color: Color(0xff4c505b),
              ),
            )),
      ],
    );
  }
}
