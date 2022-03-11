import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/views/consultas/veicular/widget_veicular/get_container_title.dart';
import 'package:consulta_integrada/views/consultas/veicular/widget_veicular/informacao_com_clipboard.dart';
import 'package:flutter/material.dart';

final _divider = Divider(color: DefaultTheme.getColor(), height: 20.0);

final _textStyleTitle = FontDefaultStyles.sm_1().apply(color: Colors.blue[900]);

Widget informacoesDoVeiculo(var model, bool baseDetran) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        getContainerTitle("Informações gerais do veículo"),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Proprietário",
                  style: _textStyleTitle,
                ),
                InformacaoComClipboard(model.proprietario.nome.trim()),
                _divider,
                Text(
                  "Placa",
                  style: _textStyleTitle,
                ),
                InformacaoComClipboard(model.placa.trim()),
                _divider,
                Container(
                  child: baseDetran
                      ? Container()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Município",
                              style: _textStyleTitle,
                            ),
                            Text(
                              model.endereco.municipioPlaca.trim(),
                              style: FontDefaultStyles.smBold(),
                            ),
                            _divider,
                          ],
                        ),
                ),
                Text(
                  "Ano de fabricação",
                  style: _textStyleTitle,
                ),
                Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    model.anoFabricacao.toString(),
                    style: FontDefaultStyles.smBold(),
                  ),
                ),
                _divider,
                Text(
                  "Tipo de veículo",
                  style: _textStyleTitle,
                ),
                Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    model.tipo.trim(),
                    style: FontDefaultStyles.smBold(),
                  ),
                ),
                _divider,
                Text(
                  "Cor",
                  style: _textStyleTitle,
                ),
                Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    model.cor.trim(),
                    style: FontDefaultStyles.smBold(),
                  ),
                ),
                _divider,
                Text(
                  "Categoria",
                  style: _textStyleTitle,
                ),
                Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    model.categoria.trim(),
                    style: FontDefaultStyles.smBold(),
                  ),
                ),
                _divider,
                Text(
                  "Espécie",
                  style: _textStyleTitle,
                ),
                Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    model.especie.trim(),
                    style: FontDefaultStyles.smBold(),
                  ),
                ),
                _divider,
                baseDetran
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 2, bottom: 2),
                            child: Text(
                              "Data Licenciamento",
                              style: _textStyleTitle,
                            ),
                          ),
                          Text(
                            model.debitos.dataLicenciamento.trim(),
                            style: FontDefaultStyles.smBold(),
                          )
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 2, bottom: 2),
                            child: Text(
                              "Data do último CRV",
                              style: _textStyleTitle,
                            ),
                          ),
                          Text(
                            model.dataUltimoCRV.trim(),
                            style: FontDefaultStyles.smBold(),
                          ),
                        ],
                      ),
              ]),
        ),
      ]);
}
