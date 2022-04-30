import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  bool _isCollapsed = true;
  bool get isCollapsed => _isCollapsed;
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void toggleIsCollapsed() {
    _isCollapsed = !_isCollapsed;
    notifyListeners();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
