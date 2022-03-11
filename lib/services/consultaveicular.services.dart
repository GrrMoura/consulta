import 'package:consulta_integrada/services/autenticacao.services.dart';
import 'package:consulta_integrada/services/requests.services.dart';
import 'package:consulta_integrada/utils/status_code_erros.dart';
import 'package:consulta_integrada/views-models/consulta.viewmodel.dart';
import 'package:dio/dio.dart';

import 'api.services.dart';

class ConsultaVeicularService {
  static Future<Response> consultaCompleta(ConsultaViewModel model) async {
    var url =
        ApiServices.concatConsultaIntegradaUrl("ConsultaVeicular/Completa");

    var options = await AutenticacaoService.getCabecalhoRequisicao();

    var responseConsultaCompleta =
        await RequestsServices.postOptions(url, model.toJson(), options);

    if (responseConsultaCompleta.statusCode != 200) {
      responseConsultaCompleta.statusMessage =
          CodigosDeEstado.numeroDoStatusCode(
              responseConsultaCompleta.statusCode);
    }

    return responseConsultaCompleta;
  }

  static Future<Response> consultaSimples(ConsultaViewModel model) async {
    var url =
        ApiServices.concatConsultaIntegradaUrl("ConsultaVeicular/Simples");

    var options = await AutenticacaoService.getCabecalhoRequisicao();

    var responseConsultaSimples =
        await RequestsServices.postOptions(url, model.toJson(), options);

    if (responseConsultaSimples.statusCode != 200) {
      responseConsultaSimples.statusMessage =
          CodigosDeEstado.numeroDoStatusCode(
              responseConsultaSimples.statusCode);
    }

    return responseConsultaSimples;
  }
}
