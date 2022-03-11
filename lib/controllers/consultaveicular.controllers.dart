import 'package:consulta_integrada/models/sessao.models.dart';
import 'package:consulta_integrada/models/veiculo_models_detranSE.dart';
import 'package:consulta_integrada/models/veiculo_models_nacional.dart';
import 'package:consulta_integrada/services/consultaveicular.services.dart';
import 'package:consulta_integrada/services/dispositivo.services.dart';
import 'package:consulta_integrada/styles/widgets/snack.widgets.dart';
import 'package:consulta_integrada/views-models/consulta.viewmodel.dart';
import 'package:consulta_integrada/views/consultas/veicular/detalhes_veiculo_consulta_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConsultaVeicularController {
  Future<void> consultarVeiculo(
      BuildContext context, ConsultaViewModel model) async {
    model.ocupado = true;

    await DispositivoServices.verificarConexao().then((conectado) async {
      if (conectado) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var usuarioSessao = Sessao.getSession(prefs);
        if (usuarioSessao.regrasAcesso
            .contains("ConsultaIntegradaVeicularCompleta")) {
          await consultaCompleta(context, model);
        } else if (usuarioSessao.regrasAcesso
            .contains("ConsultaIntegradaVeicularSimples")) {
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
        await ConsultaVeicularService.consultaCompleta(model);
    if (responseConsultaCompleta.statusCode != 200) {
      SnackWidget.showSnackBar(
          context, "Erro - ${responseConsultaCompleta.statusMessage}");
    } else {
      var veiculoModelDetran =
          VeiculoModelsDetran.fromJson(responseConsultaCompleta.data, true);
      var veiculoModelNacional =
          VeiculoModelsNacional.fromJson(responseConsultaCompleta.data, true);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DetalhesVeiculoVeicularConsultasVieww(
            modelsDetran: veiculoModelDetran,
            modelsNacional: veiculoModelNacional,
          ),
        ),
      );
    }
  }

  Future<void> consultaSimples(
      BuildContext context, ConsultaViewModel model) async {
    var responseConsultaSimples =
        await ConsultaVeicularService.consultaSimples(model);
    if (responseConsultaSimples.statusCode != 200) {
      SnackWidget.showSnackBar(
          context, "Erro - Falha na comunicação,tente novamente em breve");
    } else {
      var veiculoModelNacional =
          VeiculoModelsNacional.fromJson(responseConsultaSimples.data, false);
      var veiculoModelDetran =
          VeiculoModelsDetran.fromJson(responseConsultaSimples.data, false);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetalhesVeiculoVeicularConsultasVieww(
                modelsDetran: veiculoModelDetran,
                modelsNacional: veiculoModelNacional,
              )));
    }
  }
}
