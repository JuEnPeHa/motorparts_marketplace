import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  bool _isCollapsed = true;
  bool get isCollapsed => _isCollapsed;
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  bool _navigationDrawerIsCollapsed = true;
  bool get navigationDrawerIsCollapsed => _navigationDrawerIsCollapsed;

  void toggleIsCollapsed() {
    _isCollapsed = !_isCollapsed;
    notifyListeners();
  }

  void toggleNavigationDrawerIsCollapsed() {
    _navigationDrawerIsCollapsed = !_navigationDrawerIsCollapsed;
    notifyListeners();
  }
}
