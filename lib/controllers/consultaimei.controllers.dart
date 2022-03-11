import 'package:consulta_integrada/models/imei.models.dart';
import 'package:consulta_integrada/models/sessao.models.dart';
import 'package:consulta_integrada/services/consultaimei.services.dart';
import 'package:consulta_integrada/services/dispositivo.services.dart';
import 'package:consulta_integrada/styles/widgets/snack.widgets.dart';
import 'package:consulta_integrada/views-models/imei.consulta.viewmodel.dart';
import 'package:consulta_integrada/views/consultas/imei/detalhesconsultacompleta.imei.consultas.views.dart';
import 'package:consulta_integrada/views/consultas/imei/detalhesconsultasimples.imei.consultas.views.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConsultaImeiController {

  Future<void> consultarImei(BuildContext context, ImeiConsultaViewModel model) async {
    model.ocupado = true;

    await DispositivoServices.verificarConexao().then((conectado) async {
      if (conectado) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var usuarioSessao = Sessao.getSession(prefs);
        if (usuarioSessao.regrasAcesso.contains("ConsultaIntegradaIMEICompleta")) {
          await consultaCompleta(context, model);
        } else if (usuarioSessao.regrasAcesso.contains("ConsultaIntegradaIMEISimples")) {
          await consultaSimples(context, model);
        } else {
          SnackWidget.showSnackBar(context, "Erro - O usuário não possui permissões.");
        }
      } else {
        SnackWidget.showSnackBar(context, "Sem conexão com a internet. Estabeleça uma conexão e tente novamente.");
      }
      model.ocupado = false;
    });
  }

  Future<void> consultaCompleta(BuildContext context, ImeiConsultaViewModel model) async {
    var responseConsultaCompleta = await ConsultaImeiService.consultaCompleta(model);
    if (responseConsultaCompleta.statusCode != 200){
      SnackWidget.showSnackBar(context, "Erro - ${responseConsultaCompleta.statusMessage}");
    } else {
      var imeiModel = ImeiModels.fromJson(responseConsultaCompleta.data, true);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetalhesConsultaCompletaImeiConsultasView(model: imeiModel)));
    }
  }

  Future<void> consultaSimples(BuildContext context, ImeiConsultaViewModel model) async {
    var responseConsultaSimples = await ConsultaImeiService.consultaSimples(model);
    if (responseConsultaSimples.statusCode != 200){
      SnackWidget.showSnackBar(context, "Erro - ${responseConsultaSimples.statusMessage}");
    } else {
      var imeiModel = ImeiModels.fromJson(responseConsultaSimples.data, false);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetalhesConsultaSimplesImeiConsultasView(model: imeiModel)));
    }
  }
}