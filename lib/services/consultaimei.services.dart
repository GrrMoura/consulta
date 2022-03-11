import 'package:consulta_integrada/services/api.services.dart';
import 'package:consulta_integrada/services/autenticacao.services.dart';
import 'package:consulta_integrada/services/requests.services.dart';
import 'package:consulta_integrada/utils/status_code_erros.dart';
import 'package:consulta_integrada/views-models/imei.consulta.viewmodel.dart';
import 'package:dio/dio.dart';

class ConsultaImeiService {
  static Future<Response> consultaCompleta(ImeiConsultaViewModel model) async {
    var url =
        ApiServices.concatConsultaIntegradaUrl("ConsultaIMEI/ConsultarIMEI");

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

  static Future<Response> consultaSimples(ImeiConsultaViewModel model) async {
    var url = ApiServices.concatConsultaIntegradaUrl(
        "ConsultaIMEI/ConsultarIMEISimples");

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
