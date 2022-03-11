import 'package:flutter/material.dart';

import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/views/consultas/veicular/widget_veicular/get_container_title.dart';
import 'package:consulta_integrada/views/consultas/veicular/widget_veicular/informacao_com_clipboard.dart';

final _divider = Divider(
  color: DefaultTheme.getColor(),
  height: 20.0,
);

final _textStyleTitle = FontDefaultStyles.sm_1().apply(color: Colors.blue[900]);

Widget identificacaoDoVeiculo(var model, bool baseNacional) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      getContainerTitle("Identificação do veículo"),
      Padding(
        padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Renavam",
              style: _textStyleTitle,
            ),
            InformacaoComClipboard(model.renavam.toString()),
            _divider,
            Text(
              "Chassi",
              style: _textStyleTitle,
            ),
            InformacaoComClipboard(model.chassi.trim()),
          ],
        ),
      ),
    ],
  );
}
