import 'package:flutter/material.dart';
import 'package:nira/features/auth/controllers/login_controller.dart';
import 'package:nira/features/auth/loginpages/password_verification.dart';
import 'package:nira/features/auth/register/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
    // var screenSize = MediaQuery.of(context).size;

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
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/register.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 25, top: 60),
                      child: Text(
                        'Welcome Back',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 355,
                      left: 35,
                      right: 35,
                      child: Column(
                        children: [
                          //Email TextField
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
                          ),
                          const SizedBox(height: 12),

                          //Password TextField
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
                          const SizedBox(height: 12),

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
                                  onPressed: _loginController.signIn,
                                  icon: const Icon(Icons.arrow_forward),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterPage()),
                                  );
                                },
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPasswordPage()),
                                  );
                                },
                                child: const Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// // ignore_for_file: avoid_print


// import 'package:nira/widgets/imports.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   //text controllers
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   // final _hospitalIdController = TextEditingController();


//     //fetching additonal detail hospitalId and registerNumber for privacy
    

//     Future<void> signIn() async {
//     try {
//       // sign in
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: _emailController.text.trim(),
//         password: _passwordController.text.trim(),
//       );

//       // If sign in is successful, navigate to HomePage
//       // Navigator.pushReplacement(
//       //   // ignore: use_build_context_synchronously
//       //   context,
//       //   MaterialPageRoute(builder: 
//       //   (context) => MyBottomNavBar()),
//       // );
//       Navigator.pushReplacement(
//         // ignore: use_build_context_synchronously
//         context,
//         MaterialPageRoute(builder: 
//         (context) => HomePage()),
//       );
//     } 
//       // else sho the error output on loginpage
//         on FirebaseAuthException catch (e) {
//        print('FirebaseAuthException: ${e.code}');
//       // Handle different error types
//       String message;
//        switch (e.code) {
//         case 'user-not-found':
//           message = 'This email is not beign registered';
//           break;
//         case 'wrong-password':
//           message = 'Incorrect password';
//           break;
//         case 'invalid-email':
//           message = 'Incorrect Email';
//           break;
//         default:
//           message = 'An error occurred. Please try again.';
//       }


//       // Show error message using SnackBar
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
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }


//   @override
//   Widget build(BuildContext context) {
//     // Getthing the mobile screen size
//     var screenSize = MediaQuery.of(context).size;
//     // double aspectRatio = 16/9;
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
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage('lib/assets/register.png'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 child: Stack(
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.only(left: 25, top: 60),
//                       child: Text(
//                         'Welcome Back',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 35,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: screenSize.height * 0.4,
//                       left: 35,
//                       right: 35,
//                       child: Column(
//                         children: [
//                           // hospital id
//                           TextField(
//                             decoration: InputDecoration(
//                               fillColor: Colors.grey.shade100,
//                               filled: true,
//                               hintText: 'Hospital Id',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: screenSize.height * 0.02),
      
//                           //Email textfield
//                           TextField(
//                             controller: _emailController,
//                             decoration: InputDecoration(
//                               fillColor: Colors.grey.shade100,
//                               filled: true,
//                               hintText: 'Email',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: screenSize.height * 0.02),
      
//                           //Password Textfield
//                           TextField(
//                             controller: _passwordController,
//                             decoration: InputDecoration(
//                               fillColor: Colors.grey.shade100,
//                               filled: true,
//                               hintText: 'Password',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                             obscureText: true, // Hiding the password
//                           ),
//                           SizedBox(height: screenSize.height * 0.03),
                         
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               const Text(
//                                 'Login',
//                                 style: TextStyle(
//                                     color: Color(0xff4c505b),
//                                     fontSize: 30,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               CircleAvatar(
//                                 radius: 30,
//                                 backgroundColor: const Color(0xff4c505b),
//                                 child: IconButton(
//                                   color: Colors.white,
//                                   onPressed: signIn,
//                                   icon: const Icon(Icons.arrow_forward),
//                                 ),
//                               )
//                             ],
//                           ),
      
      
//                           SizedBox(height: screenSize.height * 0.04),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             const RegisterPage()),
//                                   );
//                                 },
//                                 child: const Text(
//                                   'Register',
//                                   style: TextStyle(
//                                     decoration: TextDecoration.underline,
//                                     fontSize: 18,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                               //  const SizedBox(height:40, width: 40, ),
//                               TextButton(
//                                   onPressed: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(builder: 
//                                       (context) => const ForgotPasswordPage()),
//                                     );
//                                   },
//                                   child: const Text(
//                                     'Forgot Password',
//                                     style: TextStyle(
//                                       decoration: TextDecoration.underline,
//                                       fontSize: 18,
//                                       color: Colors.black,
//                                     ),
//                                   ))
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
