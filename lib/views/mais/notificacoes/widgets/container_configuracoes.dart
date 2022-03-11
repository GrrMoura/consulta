import 'package:consulta_integrada/controllers/mais.controllers.dart';
import 'package:consulta_integrada/styles/widgets/divider.widgets.dart';
import 'package:consulta_integrada/views/mais/notificacoes/widgets/container_generico.dart';
import 'package:flutter/material.dart';

class ContainerConfiguracoes extends StatefulWidget {
  ContainerConfiguracoes({Key key}) : super(key: key);

  @override
  _ContainerConfiguracoesState createState() => _ContainerConfiguracoesState();
}

class _ContainerConfiguracoesState extends State<ContainerConfiguracoes> {
  var controllerMais = new MaisController();
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      InkWell(
        radius: 0,
        onTap: () {
          controllerMais
              .prepararParaNavegarParaConfiguracoesView(context)
              .then((value) {
            setState(() {});
          });
        },
        child: ContainerGenerico("Configurações", Icons.settings, 0),
      ),
      DividerWidgets.get()
    ]);
  }
}
