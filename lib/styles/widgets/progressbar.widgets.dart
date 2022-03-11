import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:flutter/material.dart';

class ProgressBarkWidget {
  static Widget showProgressBar() {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(DefaultTheme.getColor()),
        )));
  }
}
