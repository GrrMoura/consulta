import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:flutter/material.dart';

class SnackWidget {
  static void showSnackBar(BuildContext context, String value){
    final snackBar = SnackBar(backgroundColor: DefaultTheme.getColor(), content: Text(value, style: FontDefaultStyles.sm(),));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}