import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:flutter/material.dart';

Widget getContainerTitle(String title) {
  return Container(
    width: double.infinity,
    color: Colors.grey[300],
    padding: const EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 5.0),
    child: Text(
      title,
      style: FontDefaultStyles.sm(),
    ),
  );
}
