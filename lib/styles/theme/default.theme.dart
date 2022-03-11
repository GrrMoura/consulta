import 'package:flutter/material.dart';

class DefaultTheme {
  static final Color _color = Colors.blueGrey;

  static Color getColor() => _color;

  static final ThemeData _theme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: _color)
        .copyWith(secondary: Colors.white),
  );

  static ThemeData getTheme() => _theme;
}
