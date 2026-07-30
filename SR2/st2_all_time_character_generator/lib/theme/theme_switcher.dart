import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_theme.dart';

/// Available theme options for the app.
/// Extends the existing AppTheme from app_theme.dart with high-contrast modes.
enum ThemeOption {
  light,
  dark,
  system,
  highContrastLight,
  highContrastDark,
}

/// Riverpod provider for ThemeSwitcher state.
/// Uses NotifierProvider (Riverpod 3.x API) instead of deprecated StateNotifierProvider.
final themeSwitcherProvider =
    NotifierProvider<ThemeSwitcher, ThemeOption>(ThemeSwitcher.new);

/// Manages theme state with persistence via SharedPreferences.
/// Implementation as defined in 4-UXUI-Design.md §2.4.
class ThemeSwitcher extends Notifier<ThemeOption> {
  @override
  ThemeOption build() {
    _loadThemePreference();
    return ThemeOption.system;
  }

  void setTheme(ThemeOption option) {
    state = option;
    _saveThemePreference(option);
  }

  /// Converts the current ThemeOption to Flutter's ThemeMode.
  ThemeMode get themeMode {
    switch (state) {
      case ThemeOption.light:
        return ThemeMode.light;
      case ThemeOption.dark:
        return ThemeMode.dark;
      case ThemeOption.highContrastLight:
        return ThemeMode.light;
      case ThemeOption.highContrastDark:
        return ThemeMode.dark;
      case ThemeOption.system:
        return ThemeMode.system;
    }
  }

  /// Returns the appropriate ThemeData based on current selection.
  ThemeData getThemeData(BuildContext context) {
    final platformBrightness = MediaQuery.platformBrightnessOf(context);
    final isDark = platformBrightness == Brightness.dark;

    switch (state) {
      case ThemeOption.light:
        return AppTheme.lightTheme;
      case ThemeOption.dark:
        return AppTheme.darkTheme;
      case ThemeOption.highContrastLight:
        return AppTheme.highContrastLightTheme;
      case ThemeOption.highContrastDark:
        return AppTheme.highContrastDarkTheme;
      case ThemeOption.system:
        return isDark ? AppTheme.darkTheme : AppTheme.lightTheme;
    }
  }

  Future<void> _saveThemePreference(ThemeOption option) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme_option', option.name);
  }

  Future<void> _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString('theme_option');
    if (saved != null) {
      state = ThemeOption.values.firstWhere(
        (e) => e.name == saved,
        orElse: () => ThemeOption.system,
      );
    }
  }
}