import 'package:flutter/material.dart';

class BottomNavigationController extends ChangeNotifier {
  int _selectedIndex = 1; // Set default to 1 for homepage

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
