import 'package:flutter/material.dart';
import 'package:nira/features/auth/controllers/register_controller.dart';
import 'package:nira/features/auth/register/widget/register_footer.dart';
import 'package:nira/widgets/imports.dart';

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
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/register2.png'),
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
                  body: Stack(
                    children: [
                      SingleChildScrollView(
                        padding: const EdgeInsets.only(
                          top: 12,
                          left: 35,
                          right: 35,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildTextField(
                                _hospitalIdController, 'Hospital Id'),
                            const SizedBox(height: 10),
                            buildTextField(
                                _hospitalNameController, 'Hospital Name'),
                            const SizedBox(height: 10),
                            buildTextField(_registrationNumberController,
                                'Registration Number'),
                            const SizedBox(height: 10),
                            buildTextField(_emailController, 'Email'),
                            const SizedBox(height: 10),
                            buildTextField(
                                _contactPersonController, 'Contact Person'),
                            const SizedBox(height: 10),
                            buildTextField(
                                _phoneNumberController, 'Phone Number'),
                            const SizedBox(height: 10),
                            buildTextField(
                                _addressController, 'Location/Address'),
                            const SizedBox(height: 10),
                            buildPasswordField(_passwordController, 'Password'),
                            const SizedBox(height: 10),
                            buildPasswordField(
                                _confirmPasswordController, 'Confirm Password'),
                            const SizedBox(height: 10),
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
                                      _controller.signUp();
                                    },
                                    icon: const Icon(Icons.arrow_forward),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            RegisterFooter()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
}



// import 'package:nira/pages/register/widget/register_footer.dart';
// import 'package:nira/widgets/imports.dart';

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({
//     super.key,
//   });

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final _hospitalIdController = TextEditingController();
//   final _hospitalNameController = TextEditingController();
//   final _registrationNumberController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _contactPersonController = TextEditingController();
//   final _phoneNumberController = TextEditingController();
//   final _addressController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();

//   Future<void> signUp() async {
//     // Check if passwords don't match
//     if (_passwordController.text.trim() !=
//         _confirmPasswordController.text.trim()) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Passwords do not match'),
//           duration: Duration(seconds: 3),
//         ),
//       );
//       return;
//     }

//     try {
//       // Create a new user
//       UserCredential userCredential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: _emailController.text.trim(),
//         password: _passwordController.text.trim(),
//       );

//       // Save additional user information to Firestore
//       await FirebaseFirestore.instance
//           .collection('hospitals') // Collection name
//           .doc(userCredential.user?.uid) // User UID as the document ID
//           .set({
//         'hospitalId': _hospitalIdController.text.trim(),
//         'hospitalName': _hospitalNameController.text.trim(),
//         'registrationNumber': _registrationNumberController.text.trim(),
//         'contactPerson': _contactPersonController.text.trim(),
//         'phoneNumber': _phoneNumberController.text.trim(),
//         'address': _addressController.text.trim(),
//         'email': _emailController.text.trim(),
//         'createdAt': FieldValue.serverTimestamp(),
//       });

//       // Show success message
//       // ignore: use_build_context_synchronously
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Registration successful! Please log in.'),
//           duration: Duration(seconds: 3),
//         ),
//       );

//       // Navigate to the LoginPage after successful sign-up
//       await Future.delayed(
//           const Duration(seconds: 3)); // Wait for SnackBar to disappear
//       // ignore: use_build_context_synchronously
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => LoginPage()),
//       );
//     } on FirebaseAuthException catch (e) {
//       String message;
//       switch (e.code) {
//         case 'email-already-in-use':
//           message = 'This email is already registered';
//           break;
//         case 'weak-password':
//           message = 'Password should be at least 6 characters';
//           break;
//         case 'invalid-email':
//           message = 'Invalid email format';
//           break;
//         default:
//           message = 'An error occurred. Please try again.';
//       }

//       // Show error message
//       // ignore: use_build_context_synchronously
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(message),
//           duration: const Duration(seconds: 3),
//         ),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _hospitalIdController.dispose();
//     _hospitalNameController.dispose();
//     _registrationNumberController.dispose();
//     _contactPersonController.dispose();
//     _phoneNumberController.dispose();
//     _addressController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // var screenSize = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Stack(
//           children: [
//             Positioned(
//               top: 0.0,
//               left: 0.0,
//               right: 0.0,
//               bottom: 0.0,
//               child: Container(
//                 // width: screenSize.width,
//                 // height: screenSize.height,
//                 width: double.infinity,
//                 height: double.infinity,
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage('lib/assets/register2.png'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 child: Scaffold(
//                   backgroundColor: Colors.transparent,
//                   appBar: AppBar(
//                     centerTitle: true,
//                     backgroundColor: Colors.transparent,
//                     title: const Text(
//                       'Create Account',
//                       style: TextStyle(
//                         fontSize: 30,
//                         color: Colors.black87,
//                       ),
//                     ),
//                   ),
//                   body: Stack(
//                     children: [
//                       SingleChildScrollView(
//                         padding: EdgeInsets.only(
//                           top: 12,
//                           left: 35,
//                           right: 35,
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             TextField(
//                               controller: _hospitalIdController,
//                               decoration: InputDecoration(
//                                 fillColor: Colors.grey.shade100,
//                                 filled: true,
//                                 hintText: 'Hospital Id',
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             TextField(
//                               controller: _hospitalNameController,
//                               decoration: InputDecoration(
//                                 fillColor: Colors.grey.shade100,
//                                 filled: true,
//                                 hintText: 'Hospital Name',
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             TextField(
//                               controller: _registrationNumberController,
//                               decoration: InputDecoration(
//                                 fillColor: Colors.grey.shade100,
//                                 filled: true,
//                                 hintText: 'Registration Number',
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                               ),
//                               obscureText: false,
//                             ),
//                             const SizedBox(height: 10),
//                             TextField(
//                               controller: _emailController,
//                               decoration: InputDecoration(
//                                 fillColor: Colors.grey.shade100,
//                                 filled: true,
//                                 hintText: 'Email',
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                               ),
//                               obscureText: false,
//                             ),
//                             const SizedBox(height: 10),
//                             TextField(
//                               controller: _contactPersonController,
//                               decoration: InputDecoration(
//                                 fillColor: Colors.grey.shade100,
//                                 filled: true,
//                                 hintText: 'Contact Person',
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                               ),
//                               obscureText: false,
//                             ),
//                             const SizedBox(height: 10),
//                             TextField(
//                               controller: _phoneNumberController,
//                               decoration: InputDecoration(
//                                 fillColor: Colors.grey.shade100,
//                                 filled: true,
//                                 hintText: 'Phone Number',
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                               ),
//                               obscureText: false,
//                             ),
//                             const SizedBox(height: 10),
//                             TextField(
//                               controller: _addressController,
//                               decoration: InputDecoration(
//                                 fillColor: Colors.grey.shade100,
//                                 filled: true,
//                                 hintText: 'Location/Address',
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                               ),
//                               obscureText: false,
//                             ),
//                             const SizedBox(height: 10),
//                             TextField(
//                               controller: _passwordController,
//                               decoration: InputDecoration(
//                                 fillColor: Colors.grey.shade100,
//                                 filled: true,
//                                 hintText: 'Password',
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                               ),
//                               obscureText: true,
//                             ),
//                             const SizedBox(height: 10),
//                             TextField(
//                               controller: _confirmPasswordController,
//                               decoration: InputDecoration(
//                                 fillColor: Colors.grey.shade100,
//                                 filled: true,
//                                 hintText: 'Confirm Password',
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                               ),
//                               obscureText: true,
//                             ),
//                             const SizedBox(height: 10),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Text(
//                                   'Register',
//                                   style: TextStyle(
//                                       color: Color(0xff4c505b),
//                                       fontSize: 27,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 CircleAvatar(
//                                   radius: 30,
//                                   backgroundColor: const Color(0xff4c505b),
//                                   child: IconButton(
//                                     color: Colors.white,
//                                     onPressed: () {
//                                       signUp();
//                                     },
//                                     icon: const Icon(Icons.arrow_forward),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             const SizedBox(height: 10),
//                             RegisterFooter()
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
