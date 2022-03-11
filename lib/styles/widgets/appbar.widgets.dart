import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:flutter/material.dart';

class AppBarDefault {

  static Widget getAppComTitulo({String titulo = "Consulta Integrada"}){
    return AppBar(
      backgroundColor: Colors.blueGrey,
      title: Text(titulo, style: FontDefaultStyles.sm(),),
    );
  }

}