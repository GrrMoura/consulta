import 'package:consulta_integrada/views/consultas/veicular/widget_veicular/identificacao_do_veiculo.dart';
import 'package:consulta_integrada/views/consultas/veicular/widget_veicular/informacoes_do_possuidor.dart';
import 'package:consulta_integrada/views/consultas/veicular/widget_veicular/informacoes_do_veiculo.dart';
import 'package:consulta_integrada/views/consultas/veicular/widget_veicular/informacoes_proprietario.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BaseNacional extends StatelessWidget {
  var model;

  BaseNacional(this.model, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
        style: TextStyle(color: Colors.black),
        child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
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
                              informacoesDoVeiculo(model, false),
                              identificacaoDoVeiculo(model, false),
                              informacoesProprietario(model, false),
                              identificacaoDoPossuidor(model),
                            ]
                          : <Widget>[
                              informacoesDoVeiculo(model, false),
                              identificacaoDoVeiculo(model, false),
                            ])));
        }));
  }
}
