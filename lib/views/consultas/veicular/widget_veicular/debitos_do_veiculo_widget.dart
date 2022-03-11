import 'package:consulta_integrada/views/consultas/veicular/widget_veicular/debitos_atrasados_do_veiculo.dart';
import 'package:consulta_integrada/views/consultas/veicular/widget_veicular/debitos_atuais_do_veiculo.dart';
import 'package:flutter/material.dart';

Widget debitosVeiculo(var model) {
  return Column(children: [
    debitosAtuaisVeiculoo(model),
    debitosAtrasadosVeiculoo(model)
  ]);
}
