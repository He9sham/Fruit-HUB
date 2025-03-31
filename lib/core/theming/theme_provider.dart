import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  static const String _themeKey = 'theme_mode';

  ThemeMode _themeMode = ThemeMode.light;
  bool _isLoaded = false;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  ThemeProvider() {
    _loadThemeFromPrefs();
  }

  void _loadThemeFromPrefs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isDark = prefs.getBool(_themeKey) ?? false;
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
      _isLoaded = true;
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading theme preferences: $e');
      _isLoaded = true;
      // Default to light theme if there's an error
      _themeMode = ThemeMode.light;
      notifyListeners();
    }
  }

  void toggleTheme() async {
    // Only toggle if preferences have been loaded
    if (!_isLoaded) return;

    try {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();

      // Save preference after notifying listeners
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_themeKey, _themeMode == ThemeMode.dark);
    } catch (e) {
      debugPrint('Error saving theme preferences: $e');
      // If saving fails, revert the theme
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
    }
  }
}
