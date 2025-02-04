import 'package:nira/imports.dart';

class RegisterForm extends StatelessWidget {
  final RegisterController controller;

  const RegisterForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTextField(controller.hospitalIdController, 'Hospital Id'),
        const SizedBox(height: 8),
        buildTextField(controller.hospitalNameController, 'Hospital Name'),
        const SizedBox(height: 8),
        buildTextField(
            controller.registrationNumberController, 'Registration Number'),
        const SizedBox(height: 8),
        buildTextField(controller.emailController, 'Email'),
        const SizedBox(height: 8),
        buildTextField(controller.contactPersonController, 'Contact Person'),
        const SizedBox(height: 8),
        buildTextField(controller.phoneNumberController, 'Phone Number'),
        const SizedBox(height: 8),
        buildTextField(controller.addressController, 'Location/Address'),
        const SizedBox(height: 8),
        buildPasswordField(controller.passwordController, 'Password'),
        const SizedBox(height: 8),
        buildPasswordField(
            controller.confirmPasswordController, 'Confirm Password'),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Register',
              style: TextStyle(
                  color: Color(0xff4c505b),
                  fontSize: 27,
                  fontWeight: FontWeight.bold),
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: const Color(0xff4c505b),
              child: IconButton(
                color: Colors.white,
                onPressed: () {
                  controller.signUp();
                },
                icon: const Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Widget buildTextField(TextEditingController controller, String hintText) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      fillColor: Colors.grey.shade100,
      filled: true,
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

Widget buildPasswordField(TextEditingController controller, String hintText) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      fillColor: Colors.grey.shade100,
      filled: true,
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    obscureText: true,
  );
}
