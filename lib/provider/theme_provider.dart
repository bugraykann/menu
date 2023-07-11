import 'package:flutter/material.dart';
import 'package:menu_demo/ui/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  bool _isPrimary = true;
  bool get isPrimary => _isPrimary;

  ThemeData get themeData =>
      _isPrimary ? AppTheme.kPrimaryTheme : AppTheme.kSecondaryTheme;

  void toogleTheme() {
    _isPrimary = !_isPrimary;
    notifyListeners();
  }
}
