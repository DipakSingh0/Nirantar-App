
import 'package:nira/imports.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _hospitalIdController = TextEditingController();
  final _hospitalNameController = TextEditingController();
  final _registrationNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _contactPersonController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  late final RegisterController _controller;

  @override
  void initState() {
    super.initState();
    _controller = RegisterController(
      context: context,
      hospitalIdController: _hospitalIdController,
      hospitalNameController: _hospitalNameController,
      registrationNumberController: _registrationNumberController,
      emailController: _emailController,
      contactPersonController: _contactPersonController,
      phoneNumberController: _phoneNumberController,
      addressController: _addressController,
      passwordController: _passwordController,
      confirmPasswordController: _confirmPasswordController,
    );
  }

  @override
  void dispose() {
    _hospitalIdController.dispose();
    _hospitalNameController.dispose();
    _registrationNumberController.dispose();
    _contactPersonController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                title: const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black87,
                  ),
                ),
              ),
              body: SingleChildScrollView( 
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    RegisterForm(controller: _controller),
                    const SizedBox(height: 20),
                    const RegisterFooter(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }}