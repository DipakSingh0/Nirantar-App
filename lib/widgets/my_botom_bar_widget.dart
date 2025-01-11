// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:projet/main.dart';
// import 'package:projet/pages/home/home_page.dart';
// import 'package:projet/pages/others/profile_page.dart';
// import 'package:projet/pages/others/settings_page.dart';


// class MyBottomBarWidget extends StatefulWidget {
//   const MyBottomBarWidget({super.key});

//   @override
//   State<MyBottomBarWidget> createState() => _MyBottomBarWidgetState();
// }

// class _MyBottomBarWidgetState extends State<MyBottomBarWidget> {
//   int index = 1;
//   final navigationKey = GlobalKey<CurvedNavigationBarState>();

//   final screens = [
//     ProfilePage(),
//     HomePage(),
//     SettingsPage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final items = [
//       Icon(Icons.search, size: 30),
//       Icon(Icons.home, size: 30),
//       Icon(Icons.settings, size: 30),
//     ];

//     return Theme(
//         data: Theme.of(context)
//             .copyWith(iconTheme: IconThemeData(color: Colors.white)),
//         child: CurvedNavigationBar(
//           key:navigatorKey , 
//           backgroundColor: Colors.transparent,
//           color: const Color.fromARGB(255, 44, 156, 247),
//           buttonBackgroundColor: Colors.blueAccent,
//           animationCurve: Curves.easeInOut,
//           animationDuration: const Duration(milliseconds: 300),
//           index: index,
//           onTap: (index) => setState(() => this.index = index),
//           items: const [
//             Icon(Icons.search),
//             Icon(Icons.home),
//             Icon(Icons.settings),
//           ],
//         ));
//   }
// }
