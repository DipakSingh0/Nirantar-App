// import 'package:animated_progress_bar/animated_progress_bar.dart';
// import 'package:flutter/material.dart';

// class CircularAnimatedWidget extends StatefulWidget {
//   const CircularAnimatedWidget({super.key});

//   @override
//   State<CircularAnimatedWidget> createState() => _CircularAnimatedWidgetState();
// }

// class _CircularAnimatedWidgetState extends State<CircularAnimatedWidget> {
//   @override
//   Widget build(BuildContext context) {
//     var screenHeight = MediaQuery.of(context).size.height;
//     var screenWidth = MediaQuery.of(context).size.width;
//     // var theme = Theme.of(context);


//     return Stack(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             color: Colors.transparent,
//             height: screenHeight / 7.2,
//             width: screenWidth / 3.2,
//             child: AspectRatio(
//               aspectRatio: 1.0,
//               child: AnimatedProgressBar(
//                 stroke: 20,
//                 color: Colors.blue,
//                 style: PaintingStyle.stroke,
//                 percentage: 0.55,
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: 32,
//           left: 42,
//           child: Text(
//             'SpO2',
//             style: TextStyle(fontSize: 28, color: Colors.black),
//           ),
//         ),
//       ],
//     );
//   }
// }
