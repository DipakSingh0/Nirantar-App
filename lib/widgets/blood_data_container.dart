// import 'package:flutter/material.dart';

// class BloodDataContainer extends StatelessWidget {
//   final String parameterName;
//   final String value;
//   final String measure;
//   final Icon icon;

//   const BloodDataContainer({
//     super.key,
//     required this.parameterName,
//     required this.value,
//     required this.measure,
//     required this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context);

//     return SafeArea(
//       child: Container(
//         height: 60,
//         width: 60,
//         decoration: BoxDecoration(
//           color: theme.cardColor,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             return Padding(
//               padding: const EdgeInsets.all(4.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 15.0, left: 2),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           flex: 1,
//                           child: SizedBox(
//                             width: 10,
//                             child: icon,
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 3,
//                         ),
//                         Expanded(
//                           flex: 3,
//                           child: Text(
//                             parameterName,
//                             style:
//                                 Theme.of(context).textTheme.bodySmall?.copyWith(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w800,
//                                     ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           value,
//                           style:
//                               Theme.of(context).textTheme.labelMedium?.copyWith(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                         ),
//                         const SizedBox(
//                           width: 3,
//                         ),
//                         Text(
//                           measure,
//                           style:
//                               Theme.of(context).textTheme.labelMedium?.copyWith(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
