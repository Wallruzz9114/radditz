import 'package:flutter/material.dart';
import 'package:radditz/constants/constants.dart';

class AppTheme {
  static ThemeData theme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: PalleteConstants.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: PalleteConstants.backgroundColor,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: PalleteConstants.blueColor,
    ),
  );
}
