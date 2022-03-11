import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:flutter/material.dart';

class ErroView extends StatelessWidget {
  ErroView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Nenhuma informação encontrada \n ",
              style: FontDefaultStyles.sm(),
            ),
          ],
        ),
      ),
    );
  }
}
