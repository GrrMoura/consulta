import 'package:consulta_integrada/controllers/login_controller.dart';
import 'package:consulta_integrada/controllers/mais.controllers.dart';
import 'package:consulta_integrada/styles/widgets/appbar.widgets.dart';
import 'package:consulta_integrada/views-models/configuracoes.mais.viewmodel.dart';
import 'package:consulta_integrada/views/mais/configuracoes/configuracoesWidgets/botao_sair_widget.dart';
import 'package:consulta_integrada/views/mais/configuracoes/configuracoesWidgets/botao_sobre_widget.dart';
import 'package:consulta_integrada/views/mais/configuracoes/configuracoesWidgets/dados_usuario.dart';
import 'package:consulta_integrada/views/mais/configuracoes/configuracoesWidgets/preferencias.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ConfiguracoesMaisConsultasView extends StatefulWidget {
  ConfiguracoesMaisViewModel model;
  ConfiguracoesMaisConsultasView({Key key, this.model}) : super(key: key);

  @override
  _ConfiguracoesMaisConsultasViewState createState() =>
      new _ConfiguracoesMaisConsultasViewState();
}

class _ConfiguracoesMaisConsultasViewState
    extends State<ConfiguracoesMaisConsultasView> {
  var leitorBiometricoController = LoginController();
  var controllerMais = new MaisController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault.getAppComTitulo(titulo: "Configurações"),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              DadosDoUsuario(widget.model),
              Preferencias(widget.model),
              BotaoSobre(),
              BotaoSair(leitorBiometricoController, controllerMais)
            ],
          ),
        ),
      ),
    );
  }
}
