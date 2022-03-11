import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/utils/format.utils.dart';
import 'package:consulta_integrada/views/consultas/veicular/widget_veicular/get_container_title.dart';
import 'package:flutter/material.dart';

final _divider = Divider(color: DefaultTheme.getColor(), height: 20.0);

final _textStyleTitle = FontDefaultStyles.sm_1().apply(color: Colors.blue[900]);

Widget debitosAtuaisVeiculoo(var model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      getContainerTitle("Débitos do ano atual"),
      Padding(
        padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Licenciamento",
              style: _textStyleTitle,
            ),
            Text(
              FormatUtils.formatarMoeda(model.debitos.totalLicenciamento),
              style: FontDefaultStyles.smBold(),
            ),
            _divider,
            Text(
              "IPVA",
              style: _textStyleTitle,
            ),
            Text(
              FormatUtils.formatarMoeda(model.debitos.totalIpva),
              style: FontDefaultStyles.smBold(),
            ),
            _divider,
            Text(
              "Seguro",
              style: _textStyleTitle,
            ),
            Text(
              FormatUtils.formatarMoeda(model.debitos.totalSeguro),
              style: FontDefaultStyles.smBold(),
            ),
            _divider,
            Text(
              "Multa",
              style: _textStyleTitle,
            ),
            Text(
              FormatUtils.formatarMoeda(model.debitos.totalMulta),
              style: FontDefaultStyles.smBold(),
            ),
            _divider,
            Text(
              "Outros",
              style: _textStyleTitle,
            ),
            Text(
              FormatUtils.formatarMoeda(model.debitos.totalOutros),
              style: FontDefaultStyles.smBold(),
            ),
            _divider,
            Text(
              "Total débitos",
              style: _textStyleTitle,
            ),
            Text(
              FormatUtils.formatarMoeda(model.debitos.totalDebitosGerais),
              style: FontDefaultStyles.smBold(),
            ),
          ],
        ),
      ),
    ],
  );
}
