import 'package:consulta_integrada/views/consultas/veicular/widget_veicular/debitos_do_veiculo_widget.dart';
import 'package:consulta_integrada/views/consultas/veicular/widget_veicular/identificacao_do_veiculo.dart';
import 'package:consulta_integrada/views/consultas/veicular/widget_veicular/informacoes_do_veiculo.dart';
import 'package:consulta_integrada/views/consultas/veicular/widget_veicular/informacoes_proprietario.dart';
import 'package:consulta_integrada/views/consultas/veicular/widget_veicular/restrincoes_do_veiculo.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BaseDetran extends StatelessWidget {
  var model;
  final baseDetran = true;

  BaseDetran(this.model, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(color: Colors.black),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: model.consultaCompleta
                      ? <Widget>[
                          informacoesDoVeiculo(model, true),
                          restricoesDoVeiculo(model),
                          identificacaoDoVeiculo(model, true),
                          informacoesProprietario(model, true),
                          debitosVeiculo(model),
                        ]
                      : <Widget>[
                          informacoesDoVeiculo(model, true),
                          restricoesDoVeiculo(model),
                          identificacaoDoVeiculo(model, true),
                          debitosVeiculo(model)
                        ],
                )),
          );
        },
      ),
    );
  }
}
