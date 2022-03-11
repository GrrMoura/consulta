import 'package:consulta_integrada/controllers/login_controller.dart';
import 'package:consulta_integrada/controllers/mais.controllers.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BotaoSair extends StatefulWidget {
  LoginController leitorBiometricoController;
  MaisController controllerMais;

  BotaoSair(this.leitorBiometricoController, this.controllerMais, {Key key})
      : super(key: key);

  @override
  State<BotaoSair> createState() => _BotaoSairState();
}

class _BotaoSairState extends State<BotaoSair> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Material(
            color: Colors.white,
            child: MaterialButton(
              minWidth: 100.0,
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              onPressed: () {
                dialogSairDoAplicativo().then((value) {
                  setState(() {});
                });
              },
              child: Text("Sair",
                  textAlign: TextAlign.center,
                  style: FontDefaultStyles.sm().copyWith(
                      color: Colors.red[900], fontWeight: FontWeight.bold)),
            ),
          )),
    );
  }

//TODO: FAZER RESETE DE SENHA
  //TODO:  FAZER UM UPGRADE PARA REMOVER NOTIFICACOES
  Future<void> dialogSairDoAplicativo() {
    return showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: Text(
                "Deseja sair do aplicativo?\nisso removerá todas suas preferências",
                style: FontDefaultStyles.sm_1Bold()),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text("Não"),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              CupertinoDialogAction(
                child: Text("Sim"),
                onPressed: () {
                  setState(() {});
                  widget.controllerMais.encerrarSessao(context).then((value) {
                    setState(() {});
                  });
                },
                isDestructiveAction: true,
              ),
            ],
          );
        });
  }
}
