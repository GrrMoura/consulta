import 'package:consulta_integrada/controllers/mais.controllers.dart';
import 'package:consulta_integrada/views/mais/notificacoes/widgets/container_configuracoes.dart';
import 'package:consulta_integrada/views/mais/notificacoes/widgets/container_notifcacoes.widget.dart';
import 'package:flutter/material.dart';

class HomeMaisConsultasView extends StatefulWidget {
  HomeMaisConsultasView({Key key}) : super(key: key);

  @override
  _HomeMaisConsultasViewState createState() =>
      new _HomeMaisConsultasViewState();
}

class _HomeMaisConsultasViewState extends State<HomeMaisConsultasView> {
  var controllerMais = new MaisController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 7),
              ContainerNotificacoes(),
              ContainerConfiguracoes(),
            ],
          ),
        ),
      ),
    );
  }
}
