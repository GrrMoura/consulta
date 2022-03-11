import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContainerGenerico extends StatelessWidget {
  IconData iconData;
  var titulo;
  double margin;

  ContainerGenerico(this.titulo, this.iconData, this.margin, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child:
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
        Container(
          padding: const EdgeInsets.all(6.0),
          height: 30.0,
          child: Icon(
            iconData,
            color: DefaultTheme.getColor(),
          ),
        ),
        Expanded(
            child: Container(
                margin: EdgeInsets.only(top: margin),
                child: Text(titulo, style: FontDefaultStyles.sm()))),
        Container(
          child: Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: DefaultTheme.getColor(),
          ),
        ),
      ]),
    );
  }
}
