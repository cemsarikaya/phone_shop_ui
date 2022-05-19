import 'package:flutter/material.dart';

class LighTheme {
  late ThemeData theme;

  LighTheme() {
    theme = ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
      ),
      scaffoldBackgroundColor: Colors.white.withOpacity(0.9),
      colorScheme: const ColorScheme.light(),
    );
  }
}
