import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/styles/widgets/container.widgets.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DadosDoUsuario extends StatelessWidget {
  var model;

  DadosDoUsuario(this.model, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ContainerWidgets.getContainerTitle("Dados do usuário"),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 15, top: 9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(children: <Widget>[
                  Text(
                    "Nome",
                    style: FontDefaultStyles.sm_1Bold(),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 5, top: 5, right: 5),
                          child: Text(
                            model.nome,
                            style: FontDefaultStyles.sm_1()
                                .copyWith(color: Colors.grey),
                            textAlign: TextAlign.center,
                          ))),
                ]),
                Divider(color: DefaultTheme.getColor(), height: 20),
                Row(children: <Widget>[
                  Text(
                    "CPF",
                    style: FontDefaultStyles.sm_1Bold(),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 5, top: 5, right: 5),
                          child: Text(
                            model.cpf,
                            style: FontDefaultStyles.sm_1()
                                .copyWith(color: Colors.grey),
                            textAlign: TextAlign.center,
                          ))),
                ]),
              ],
            ),
          ),
        )
      ],
    );
  }
}
