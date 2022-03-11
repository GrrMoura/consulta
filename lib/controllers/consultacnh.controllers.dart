import 'package:consulta_integrada/models/cnh.models.dart';
import 'package:consulta_integrada/models/sessao.models.dart';
import 'package:consulta_integrada/services/consultacnh.services.dart';
import 'package:consulta_integrada/services/dispositivo.services.dart';
import 'package:consulta_integrada/styles/widgets/snack.widgets.dart';
import 'package:consulta_integrada/views-models/consulta.viewmodel.dart';
import 'package:consulta_integrada/views/consultas/cnh/cnhdetalhes.cnh.consultas.views.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConsultaCnhController {
  Future<void> consultarCnh(
      BuildContext context, ConsultaViewModel model) async {
    model.ocupado = true;

    await DispositivoServices.verificarConexao().then((conectado) async {
      if (conectado) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var usuarioSessao = Sessao.getSession(prefs);
        if (usuarioSessao.regrasAcesso
            .contains("ConsultaIntegradaCNHCompleta")) {
          await consultaCompleta(context, model);
        } else if (usuarioSessao.regrasAcesso
            .contains("ConsultaIntegradaCNHSimples")) {
          await consultaSimples(context, model);
        } else {
          SnackWidget.showSnackBar(
              context, "Erro - O usuário não possui permissões.");
        }
      }

      model.ocupado = false;
    });
  }

  Future<void> consultaCompleta(
      BuildContext context, ConsultaViewModel model) async {
    var responseConsultaCompleta =
        await ConsultaCnhService.consultaCompleta(model);
    if (responseConsultaCompleta.statusCode != 200) {
      SnackWidget.showSnackBar(
          context, "Erro - ${responseConsultaCompleta.statusMessage}");
    } else {
      var cnhModel = CnhModels.fromJson(responseConsultaCompleta.data, true);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetalhesCnhConsultasView(model: cnhModel)));
    }
  }

  Future<void> consultaSimples(
      BuildContext context, ConsultaViewModel model) async {
    var responseConsultaSimples =
        await ConsultaCnhService.consultaSimples(model);
    if (responseConsultaSimples.statusCode != 200) {
      SnackWidget.showSnackBar(
          context, "Erro - ${responseConsultaSimples.statusMessage}");
    } else {
      var cnhModel = CnhModels.fromJson(responseConsultaSimples.data, false);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetalhesCnhConsultasView(model: cnhModel)));
    }
  }
}
