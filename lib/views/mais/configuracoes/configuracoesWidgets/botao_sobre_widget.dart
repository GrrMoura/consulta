import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/views/mais/configuracoes/configuracoesWidgets/sobre_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class BotaoSobre extends StatelessWidget {
  const BotaoSobre({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Material(
            color: Colors.white,
            child: MaterialButton(
              minWidth: 100,
              padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.size,
                        alignment: Alignment.bottomCenter,
                        duration: const Duration(milliseconds: 400),
                        reverseDuration: const Duration(milliseconds: 400),
                        child: Sobre()));
              },
              child: Text("Sobre",
                  textAlign: TextAlign.center,
                  style: FontDefaultStyles.sm().copyWith(
                      color: Colors.blue[900], fontWeight: FontWeight.bold)),
            ),
          )),
    );
    //TODO: CRIAR  botão na tela de login para ir direto para o suporte;
  }
}
