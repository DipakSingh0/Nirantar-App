// import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import '../pages/home/home_page.dart';
// import '../pages/others/settings_page.dart';
// import '../pages/profile/profile_page.dart';

// class MyBottomNavBar extends StatefulWidget {
//   const MyBottomNavBar({super.key});

//   @override
//   State<MyBottomNavBar> createState() => _MyBottomNavBarState();
// }

// class _MyBottomNavBarState extends State<MyBottomNavBar> {
//   // index for selecting page 1 for homepage  at startup
//   int selectedIndex = 1;

// // list of pages
//   final List<Widget> screens = [
//     HomePage(),
//     ProfilePage(),
//     SettingsPage(),
//   ];

//   // defineing controller
//   PageController pageController = PageController();

// // disposing controller
//   @override
//   void dispose() {
//     pageController.dispose();
//     super.dispose();
//   }

//   // navigation using controoler
//   void onItemTapped(int index) {
//     setState(() {
//       selectedIndex = index; //index update
//     });
//     pageController.jumpToPage(index); // navigates
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       top: false,
//       child: Scaffold(
//         body: PageView(
//           controller: pageController,
//           onPageChanged: (index) {
//             setState(() {
//               selectedIndex = index;
//             });
//           },
//           children: screens,
//         ),
//         bottomNavigationBar: CurvedNavigationBar(
//             backgroundColor: const Color.fromARGB(255, 85, 171, 241),
//             animationDuration: Duration(milliseconds: 250),
//             onTap: onItemTapped, //implementing ontap function
//             items: [
//               Icon(Icons.home, size: 30),
//               Icon(Icons.search, size: 30),
//               Icon(Icons.settings, size: 30),
//             ]),
//       ),
//     );
//   }
// }


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
