import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/views/consultas/veicular/widget_veicular/get_container_title.dart';
import 'package:flutter/material.dart';

Widget restricoesDoVeiculo(var model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      getContainerTitle("Restrições"),
      Padding(
        padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                model.debitos.todasRestricoesNumaUnicaString(),
                style: FontDefaultStyles.smBold(),
              )
            ]),
      ),
    ],
  );
}
