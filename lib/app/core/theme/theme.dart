import 'package:flutter/material.dart';

class AppTheme {
  static const MaterialColor pink = MaterialColor(
    _secondaryColor,
    <int, Color>{
      50: Color(0xFFFCE4EC),
      100: Color(0xFFF8BBD0),
      200: Color(0xFFF48FB1),
      300: Color(0xFFF06292),
      400: Color(0xFFEC407A),
      500: Color(_secondaryColor),
      600: Color(0xFFD81B60),
      700: Color(0xFFC2185B),
      800: Color(0xFFAD1457),
      900: Color(0xFF880E4F),
    },
  );
  static const int _secondaryColor = 0xFFEC0344;

  static const Color darkGray = Color(0xFF212121);
  static const Color mediumGray = Color(0xFF666666);
  static const Color lightGray = Color(0xFFE0E0E0);
  static const Color textGray = Color(0xFFB2B2B2);
  static const Color background = Color(0xFFF7F7F7);
  static const Color white = Color(0xFFFFFFFF);

  static ThemeData theme = ThemeData(
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: background,
    primaryColor: pink,
    primarySwatch: pink,
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
    ),
  );

  static Color? color({required String type}) {
    switch (type) {
      case 'rock':
        return const Color(0xFFB69E31);
      case 'ghost':
        return const Color(0xFF70559B);
      case 'steel':
        return const Color(0xFFB7B9D0);
      case 'water':
        return const Color(0xFF6493EB);
      case 'grass':
        return const Color(0xFF74CB48);
      case 'psychic':
        return const Color(0xFFFB5584);
      case 'ice':
        return const Color(0xFF9AD6DF);
      case 'dark':
        return const Color(0xFF75574C);
      case 'fairy':
        return const Color(0xFFE69EAC);
      case 'normal':
        return const Color(0xFFAAA67F);
      case 'fighting':
        return const Color(0xFFC12239);
      case 'flying':
        return const Color(0xFFA891EC);
      case 'poison':
        return const Color(0xFFA43E9E);
      case 'ground':
        return const Color(0xFFDEC16B);
      case 'bug':
        return const Color(0xFFA7B723);
      case 'fire':
        return const Color(0xFFF57D31);
      case 'electric':
        return const Color(0xFFF9CF30);
      case 'dragon':
        return const Color(0xFF7037FF);
    }
  }
}
