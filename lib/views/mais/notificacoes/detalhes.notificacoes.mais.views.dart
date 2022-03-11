import 'package:consulta_integrada/models/notificacaosimplificada.models.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/widgets/appbar.widgets.dart';
import 'package:consulta_integrada/styles/widgets/container.widgets.dart';
import 'package:flutter/material.dart';

class DetalhesNotificacoesMaisView extends StatefulWidget {
  DetalhesNotificacoesMaisView({Key key, this.model}) : super(key: key);

  final NotificacaoSimplificadaModels model;

  @override
  _DetalhesNotificacoesMaisViewState createState() =>
      new _DetalhesNotificacoesMaisViewState();
}

class _DetalhesNotificacoesMaisViewState
    extends State<DetalhesNotificacoesMaisView> {

  final _textStyleTitle =
      FontDefaultStyles.sm_1().apply(color: Colors.blue[900]);

  Widget informacoesNotificacao() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ContainerWidgets.getContainerTitle(widget.model.titulo),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.model.texto,
                    style: _textStyleTitle,
                  ),
                ]),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault.getAppComTitulo(titulo: "Notificação"),
      body: DefaultTextStyle(
        style: TextStyle(color: Colors.black),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    informacoesNotificacao(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
