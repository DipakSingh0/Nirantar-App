import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';
import 'password_verification.dart';
// import 'package:projet/pages/loginpages/login_page.dart';
// import 'package:projet/pages/loginpages/password_verification.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
  });

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

  
  Future<void> signUp() async {
    // Check if passwords dont match
    if (_passwordController.text.trim() !=
        _confirmPasswordController.text.trim()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match'),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    try {
      // Create a new user
      // await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //   email: _emailController.text.trim(),
      //   password: _passwordController.text.trim(),
        UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

       // Save additional user information to Firestore
      await FirebaseFirestore.instance
          .collection('hospitals') // Collection name
          .doc(userCredential.user?.uid) // User UID as the document ID
          .set({
        'hospitalId': _hospitalIdController.text.trim(),
        'hospitalName': _hospitalNameController.text.trim(),
        'registrationNumber': _registrationNumberController.text.trim(),
        'contactPerson': _contactPersonController.text.trim(),
        'phoneNumber': _phoneNumberController.text.trim(),
        'address': _addressController.text.trim(),
        'email': _emailController.text.trim(),
        'createdAt': FieldValue.serverTimestamp(), 
      });
      // Navigate to the HomePage after successful sign up
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } on FirebaseAuthException catch (e) {
     
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
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 3),
        ),
      );
    }
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
    var screenSize = MediaQuery.of(context).size;
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
                width: screenSize.width,
                height: screenSize.height,
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
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05,
                          left: 35,
                          right: 35,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              controller: _hospitalIdController,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Hospital Id',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: screenSize.height * 0.01),
                            TextField(
                              controller: _hospitalNameController,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Hospital Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            
                            SizedBox(height: screenSize.height * 0.01),
                            TextField(
                              controller: _registrationNumberController,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Registration Number',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              obscureText: false,
                            ),
                            SizedBox(height: screenSize.height * 0.01),
                            TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              obscureText: false,
                            ),
                            SizedBox(height: screenSize.height * 0.01),
                            TextField(
                              controller: _contactPersonController,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Contact Person',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              obscureText: false,
                            ),
                            SizedBox(height: screenSize.height * 0.01),
                            TextField(
                              controller: _phoneNumberController,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Phone Number',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              obscureText: false,
                            ),
                            SizedBox(height: screenSize.height * 0.01),
                            TextField(
                              controller: _addressController,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Location/Address',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              obscureText: false,
                            ),
                            SizedBox(height: screenSize.height * 0.01),
                            TextField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              obscureText: true,
                            ),
                            SizedBox(height: screenSize.height * 0.01),
                            TextField(
                              controller: _confirmPasswordController,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Confirm Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              obscureText: true,
                            ),
                            SizedBox(height: screenSize.height * 0.02),
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
                                      signUp();
                                    },
                                    icon: const Icon(Icons.arrow_forward),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: screenSize.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed:
                                  //  signUp,
                                  () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context)=> LoginPage()
                                      ),
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
                                      Navigator.push(context, MaterialPageRoute(builder: 
                                      (context) => ForgotPasswordPage()));
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
                            )
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
}
