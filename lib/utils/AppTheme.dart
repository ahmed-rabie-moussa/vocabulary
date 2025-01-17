import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.brown,
      scaffoldBackgroundColor: Color(0xffE6E2D8),
      appBarTheme: const AppBarTheme(
        color: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      canvasColor: Color(0xffE6E2D8),
      colorScheme: ColorScheme.light(
        primary: Color(0xff91BDBE),
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
            color: Colors.black87,
            fontFamily: "Bitter",
            fontSize: 22,
            fontWeight: FontWeight.bold),
        displayMedium: TextStyle(
            color: Colors.black87,
            fontFamily: "DMSerifDisplay",
            fontSize: 20,
            fontWeight: FontWeight.bold),
        titleMedium: TextStyle(
          color: Colors.black87,
          fontFamily: "Roboto",
          fontSize: 18,
        ),
        bodyMedium: TextStyle(
          color: Colors.black54,
        ),
        bodySmall: TextStyle(
          color: Colors.black87,
          fontFamily: "Roboto",
          fontSize: 12,
        ),
      ),
      sliderTheme: SliderThemeData(
        showValueIndicator: ShowValueIndicator.never,
      ));

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      color: Colors.brown,
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    canvasColor: Colors.grey[900],
    colorScheme: ColorScheme.dark(
      primary: Color(0xff91BDBE),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
          color: Colors.white,
          fontFamily: "Bitter",
          fontSize: 22,
          fontWeight: FontWeight.bold),
      displayMedium: TextStyle(
          color: Colors.white,
          fontFamily: "DMSerifDisplay",
          fontSize: 20,
          fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
        color: Colors.white,
        fontFamily: "Roboto",
        fontSize: 18,
      ),
      bodyMedium: TextStyle(color: Colors.white),
      bodySmall: TextStyle(
        color: Colors.white60,
        fontFamily: "Roboto",
        fontSize: 12,
      ),
    ),
  );
}
