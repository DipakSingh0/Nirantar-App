// import 'package:animated_progress_bar/animated_progress_bar.dart';
// import 'package:flutter/material.dart';

// class CirculardataContainer extends StatelessWidget {
//   final String parameterName;
//   final double percentage;
  
//   const CirculardataContainer(
//       {super.key,
//       required this.parameterName,
//       required this.percentage
//       });

//   @override
//   Widget build(BuildContext context) {
//     var screenWidth = MediaQuery.of(context).size.width;
//     var screenHeight = MediaQuery.of(context).size.height;

//     return Stack(
//       children: [
//         Container(
//           color: Colors.grey[200],
//            height: screenHeight / 6,
//           width: screenWidth / 2.7,
//           child: AspectRatio(
//             aspectRatio: 1.0,
//             child: AnimatedProgressBar(
//               stroke: 20,
//               color: Colors.blue,
//               style: PaintingStyle.stroke,
//               percentage: percentage,
//             ),
//           ),
//         ),
//         Positioned(
//           top: 32,
//           left: 42,
//           child: Text(
//             parameterName,
//             style: TextStyle(fontSize: 28, color: Colors.black),
//           ),
//         ),
//       ],
//     );
//   }
// }
