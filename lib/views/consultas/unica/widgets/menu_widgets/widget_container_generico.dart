import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContainerGenericoUnica extends StatelessWidget {
  String urlImage;
  String titulo;
  String descricao;
  ContainerGenericoUnica(this.urlImage, this.titulo, this.descricao, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(children: <Widget>[
        Container(
          padding: const EdgeInsets.all(9.0),
          height: 55.0,
          child: Image.asset(
            urlImage,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(titulo,
                  style: FontDefaultStyles.smBold()
                      .copyWith(color: Colors.blue[900])),
              Text(
                descricao,
                style: FontDefaultStyles.sm_1(),
              )
            ],
          ),
        ),
        Container(
          height: 28.0,
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
