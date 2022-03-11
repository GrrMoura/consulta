import 'package:consulta_integrada/controllers/mais.controllers.dart';
import 'package:consulta_integrada/models/itensnotificacao.models.dart';
import 'package:consulta_integrada/styles/widgets/divider.widgets.dart';
import 'package:consulta_integrada/views/mais/notificacoes/lista.notificacoes.mais.views.dart';
import 'package:consulta_integrada/views/mais/notificacoes/widgets/container_generico.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ContainerNotificacoes extends StatefulWidget {
  const ContainerNotificacoes({Key key}) : super(key: key);

  @override
  State<ContainerNotificacoes> createState() => _ContainerNotificacoesState();
}

class _ContainerNotificacoesState extends State<ContainerNotificacoes> {
  var controllerMais = new MaisController();
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      InkWell(
        radius: 0,
        onTap: () {
          var model = ItensNotificacaoModels(notificacoes: []);
          controllerMais.buscarNotificacoes(context, model).then((value) {
            setState(() {});
            if (model.notificacoes != null && model.notificacoes.length > 0)
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.size,
                      alignment: Alignment.topCenter,
                      duration: const Duration(milliseconds: 400),
                      reverseDuration: const Duration(milliseconds: 400),
                      child: ListaNotificacoesMaisView(
                        model: model,
                      )));
          });
        },
        child: ContainerGenerico("Notificações", Icons.email_outlined, 5),
      ),
      DividerWidgets.get()
    ]);
  }
}
