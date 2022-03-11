import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:flutter/material.dart';

class StatusLiberacaoView extends StatefulWidget {
  @override
  _StatusLiberacaoViewState createState() => new _StatusLiberacaoViewState();
}

class _StatusLiberacaoViewState extends State<StatusLiberacaoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(DefaultTheme.getColor()),
        )));
  }
}
