import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../pages/home/home_page.dart';
import '../pages/others/settings_page.dart';
import '../pages/profile/profile_page.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  // index for selecting page 1 for homepage  at startup
  int selectedIndex = 1;

// list of pages
  final List<Widget> screens = [
    HomePage(),
    ProfilePage(),
    SettingsPage(),
  ];

  // defineing controller
  PageController pageController = PageController();

// disposing controller
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  // navigation using controoler
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index; //index update
    });
    pageController.jumpToPage(index); // navigates
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          children: screens,
        ),
        bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: const Color.fromARGB(255, 85, 171, 241),
            animationDuration: Duration(milliseconds: 250),
            onTap: onItemTapped, //implementing ontap function
            items: [
              Icon(Icons.home, size: 30),

              Icon(Icons.search, size: 30),
              Icon(Icons.settings, size: 30),
            ]),
      ),
    );
  }
}
