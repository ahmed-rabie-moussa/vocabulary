import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  static const String _prefKey = 'themeMode';
  static const String _themeName = 'themeName';

  String? _selectedThemeName;

  String? get selectedThemeName => _selectedThemeName;

  ThemeMode get themeMode => _themeMode;

  static const Map<String, dynamic> themes = {
    "light": [null, "light"],
     "nature": ['assets/photos/nature.png', "dark"],
     "sculpture": ['assets/photos/sculpture.png', "light"],
    "dark": [null, "dark"],
  };

  ThemeProvider() {
    _loadData();
  }

  void _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final themeModeIndex = prefs.getInt(_prefKey) ?? ThemeMode.system.index;
    _selectedThemeName = prefs.getString(_themeName) ?? "light";
    _themeMode = ThemeMode.values[themeModeIndex];
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_prefKey, mode.index);
    notifyListeners();
  }

  void changeThemeBackground (String themeName) async{
    _selectedThemeName = themeName;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_themeName, themeName);
    setThemeMode(themes[themeName][1] == "light" ? ThemeMode.light: ThemeMode.dark);
  }
}
