import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = AppTheme.themeModeNotifier.value;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    AppTheme.themeModeNotifier.value = _themeMode;
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    AppTheme.themeModeNotifier.value = _themeMode;
    notifyListeners();
  }
}