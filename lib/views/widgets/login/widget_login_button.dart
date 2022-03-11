// ignore_for_file: must_be_immutable

import 'package:consulta_integrada/controllers/autenticacao.controllers.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  var model;

  GlobalKey<FormState> _formKey;

  LoginButton(this.model, this._formKey, {Key key}) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  final _autenticacaoController = AutenticacaoController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30),
          color: DefaultTheme.getColor(),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            onPressed: () {
              if (!widget.model.ocupado &&
                  widget._formKey.currentState.validate()) {
                widget._formKey.currentState.save();
                setState(() {});

                _autenticacaoController
                    .logar(context, widget.model)
                    .then((value) {
                  setState(() {});
                });
              }
            },
            child: widget.model.ocupado
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                        strokeWidth: 2))
                : Text("Entrar",
                    textAlign: TextAlign.center,
                    style: FontDefaultStyles.sm().copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ));
  }
}
