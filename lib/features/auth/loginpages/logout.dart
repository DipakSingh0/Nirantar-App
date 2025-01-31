// import 'package:flutter/material.dart';

// class LogOut extends StatelessWidget {
//   const LogOut({super.key});

//   Future<void> _showConfirmationDialog(BuildContext context) async {
//     return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Confirm Logout'),
//           content: const Text('Are you sure you want to log out?'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 Navigator.of(context).pop();
//                 // Navigator.of(context).popUntil(ModalRoute.withName('/dashboard_page'));
//                 // this is for pushing to dashboard after logout
//                 Navigator.pushReplacementNamed(context, '/dashboard');
//               },
//               child: const Text('Confirm Logout'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('LogOut'),
//         backgroundColor: Colors.white,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('This is Logout page'),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Show the confirmation dialog
//                 _showConfirmationDialog(context);
//               },
//               child: const Text('Logout'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
