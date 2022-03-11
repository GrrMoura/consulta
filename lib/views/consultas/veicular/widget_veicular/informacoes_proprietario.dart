import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/views/consultas/veicular/widget_veicular/get_container_title.dart';
import 'package:consulta_integrada/views/consultas/veicular/widget_veicular/informacao_com_clipboard.dart';
import 'package:flutter/material.dart';

final _divider = Divider(
  color: DefaultTheme.getColor(),
  height: 20.0,
);

final _textStyleTitle = FontDefaultStyles.sm_1().apply(color: Colors.blue[900]);

Widget informacoesProprietario(var model, bool baseDetran) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        getContainerTitle("Identificação do proprietário"),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
          child: baseDetran
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "CPF",
                      style: _textStyleTitle,
                    ),
                    InformacaoComClipboard(model.proprietario.cpf),
                    _divider,
                    Text(
                      "Endereço",
                      style: _textStyleTitle,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        model.endereco.logradouro.trim(),
                        style: FontDefaultStyles.smBold(),
                      ),
                    ),
                    _divider,
                    Text(
                      "Bairro",
                      style: _textStyleTitle,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        model.endereco.complemento.trim(),
                        style: FontDefaultStyles.smBold(),
                      ),
                    ),
                    _divider,
                    Text(
                      "Município",
                      style: _textStyleTitle,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        model.endereco.municipio.trim(),
                        style: FontDefaultStyles.smBold(),
                      ),
                    ),
                    _divider,
                    Text(
                      "Cep",
                      style: _textStyleTitle,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        model.endereco.cep.trim(),
                        style: FontDefaultStyles.smBold(),
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Nome",
                      style: _textStyleTitle,
                    ),
                    InformacaoComClipboard(model.proprietario.nome),
                    _divider,
                    Text(
                      "CPF",
                      style: _textStyleTitle,
                    ),
                    InformacaoComClipboard(model.proprietario.cpf),
                    _divider,
                  ],
                ),
        ),
      ]);
}
