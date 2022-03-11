import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/views/consultas/veicular/widget_veicular/get_container_title.dart';
import 'package:consulta_integrada/views/consultas/veicular/widget_veicular/informacao_com_clipboard.dart';
import 'package:flutter/material.dart';

final _divider = Divider(color: DefaultTheme.getColor(), height: 20.0);

final _textStyleTitle = FontDefaultStyles.sm_1().apply(color: Colors.blue[900]);

Widget identificacaoDoPossuidor(var model) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        getContainerTitle("Identificação do Possuidor"),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Nome",
                style: _textStyleTitle,
              ),
              InformacaoComClipboard(model.possuidor.nome),
              _divider,
              Text(
                "CPF",
                style: _textStyleTitle,
              ),
              InformacaoComClipboard(model.possuidor.cpf),
              _divider,
            ],
          ),
        ),
      ]);
}
