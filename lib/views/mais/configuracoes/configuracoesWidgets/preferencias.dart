import 'package:consulta_integrada/styles/widgets/container.widgets.dart';
import 'package:consulta_integrada/views/mais/configuracoes/configuracoesWidgets/botao_lembrar_me.dart';
import 'package:consulta_integrada/views/mais/configuracoes/configuracoesWidgets/botao_touch.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Preferencias extends StatelessWidget {
  var model;
  var valorLembrarMe;
  var valorBiometrico;
  Preferencias(this.model, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ContainerWidgets.getContainerTitle("Preferências"),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BotaoTouch(model),
                BotaoLembrarMe(model.usarLembrarMe),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Container(
            alignment: AlignmentDirectional.center,
            child: Text(
                "*Touch ID para fazer login por biometria.\n\n*Lembrar-me para lembrar do usuário.",
                style: TextStyle(fontFamily: "Montserrat", fontSize: 12.5)),
          ),
        ),
      ],
    );
  }
}
