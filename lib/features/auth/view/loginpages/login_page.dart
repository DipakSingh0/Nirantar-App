import 'package:nira/imports.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // ignore: unused_field
  late LoginController _loginController;

  @override
  void initState() {
    super.initState();
    _loginController = LoginController(
      context: context,
      emailController: _emailController,
      passwordController: _passwordController,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
@override
Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus(); 
          },
          child: Container( 
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/register2.png'),
                fit: BoxFit.cover,
              ),
            ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Stack( 
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 60),
                  child: Text(
                    'Welcome Back',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 240, left: 15, right: 15),
                  child: Column(
                    children: [
                      LoginForm(),
                      const SizedBox(height: 20),
                      LoginFooter(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  ));
}}