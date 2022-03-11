import 'dart:typed_data';

import 'package:consulta_integrada/models/cidadao.models.dart';
import 'package:consulta_integrada/models/identificacaocivil.models.dart';
import 'package:consulta_integrada/models/itensfichacriminal.models.dart';
import 'package:consulta_integrada/models/itensidentificacaocriminal.models.dart';
import 'package:consulta_integrada/models/mandadosprisao.models.dart';
import 'package:consulta_integrada/models/opcao.models.dart';
import 'package:consulta_integrada/services/api.services.dart';
import 'package:consulta_integrada/services/autenticacao.services.dart';
import 'package:consulta_integrada/services/requests.services.dart';
import 'package:consulta_integrada/utils/status_code_erros.dart';
import 'package:consulta_integrada/views-models/home.consulta.unica.viewmodel.dart';
import 'package:consulta_integrada/views-models/identificacaocivil.consulta.unica.viewmodel.dart';
import 'package:consulta_integrada/views-models/fichacriminal.consulta.unica.viewmodel.dart';
import 'package:consulta_integrada/views-models/identificacaocriminal.consulta.unica.viewmodel.dart';
import 'package:consulta_integrada/views-models/medidasprotetivas.consulta.unica.viewmodel.dart';
import 'package:dio/dio.dart';

class ConsultaUnicaService {
  static Future<Response> consulta(HomeConsultaUnicaViewModel model) async {
    var url = ApiServices.concatConsultaIntegradaUrl(
        "ConsultaUnica/ConsultarDadosWeb");

    var options = await AutenticacaoService.getCabecalhoRequisicao();

    var response =
        await RequestsServices.postOptions(url, model.toJson(), options);

    if (response.statusCode != 200) {
      response.statusMessage =
          CodigosDeEstado.numeroDoStatusCode(response.statusCode);
    }

    return response;
  }

  static bool seContemOpcao(int opcaoId, List<OpcaoModels> opcoesSelecionadas) {
    for (OpcaoModels opcaoSelecionadaCorrente in opcoesSelecionadas) {
      if (opcaoSelecionadaCorrente.id == opcaoId) {
        return true;
      }
    }
    return false;
  }

  static bool seContemRegra(List<String> regrasAcesso, String regra) {
    if (regrasAcesso.contains(regra)) return true;
    return false;
  }

  static void seContemRegraAddOpcao(List<String> regrasAcesso,
      List<OpcaoModels> opcoes, String regra, OpcaoModels opcao) {
    if (seContemRegra(regrasAcesso, regra)) {
      opcoes.add(opcao);
    }
  }

  //#region Ficha Criminal

  static Future<Response> consultaFichasCriminais(
      FichaCriminalConsultaUnicaViewModel model) async {
    var url = ApiServices.concatConsultaIntegradaUrl(
        "IdentificacoesCriminais/Cadastradas");

    var options = await AutenticacaoService.getCabecalhoRequisicao();

    var response =
        await RequestsServices.postOptions(url, model.toJson(), options);

    return response;
  }

  static Future<Response> consultaFichaCriminalPorId(
      ItemFichasCriminais model) async {
    var url = ApiServices.concatConsultaIntegradaUrl(
        "IdentificacoesCriminais/Detalhes");

    var options = await AutenticacaoService.getCabecalhoRequisicao();

    var response = await RequestsServices.postOptions(
      url,
      model.toJsonOnlyId(),
      options,
    );

    if (response.statusCode != 200) {
      response.statusMessage =
          CodigosDeEstado.numeroDoStatusCode(response.statusCode);
    }

    return response;
  }

  //#endregion

  //#region Identificação Civil

  static Future<Response> consultaIdentificacoesCivis(
      IdentificacaoCivilConsultaUnicaViewModel model) async {
    var url = ApiServices.concatConsultaIntegradaUrl(
        "IdentificacoesCivis/Cadastradas");

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

  static Future<Response> consultaIdentificacaoCivilPorId(Cidadao model) async {
    var url =
        ApiServices.concatConsultaIntegradaUrl("IdentificacoesCivis/Detalhes");

    var options = await AutenticacaoService.getCabecalhoRequisicao();

    var responseConsultaCompleta =
        await RequestsServices.postOptions(url, model.toJsonOnlyId(), options);

    if (responseConsultaCompleta.statusCode != 200) {
      responseConsultaCompleta.statusMessage =
          CodigosDeEstado.numeroDoStatusCode(
              responseConsultaCompleta.statusCode);
    }

    return responseConsultaCompleta;
  }

  static Future<Uint8List> consultaFotoPorIdMidiaFoto(
      IdentificacaoCivilModels model) async {
    var url = ApiServices.concatConsultaIntegradaUrl(
        "IdentificacoesCivis/DownloadFoto");

    var options = await AutenticacaoService.getCabecalhoRequisicao();

    var responseDownloadFoto =
        await RequestsServices.postOptionsWithByteArrayResponse(
            url, model.toJsonIdMidiaFoto(), options);

    if (responseDownloadFoto == null || responseDownloadFoto.statusCode != 200)
      return null;

    return responseDownloadFoto.data;
  }

//#endregion

  //#region Identificação Criminal

  static Future<Response> consultaIdentificacoesCriminais(
      IdentificacaoCriminalConsultaUnicaViewModel model) async {
    var url =
        ApiServices.concatConsultaIntegradaUrl("FichasCriminais/Cadastradas");

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

  static Future<Response> consultaIdentificacaoCriminalPorId(
      ItemIdentificacoesCriminais model) async {
    var url =
        ApiServices.concatConsultaIntegradaUrl("FichasCriminais/Detalhes");

    var options = await AutenticacaoService.getCabecalhoRequisicao();

    var response =
        await RequestsServices.postOptions(url, model.toJsonOnlyId(), options);

    if (response.statusCode != 200) {
      response.statusMessage =
          CodigosDeEstado.numeroDoStatusCode(response.statusCode);
    }

    return response;
  }

  static Future<Uint8List> consultaFotoIdentificacaoCriminalPorId(
      String idIdentificacaoCriminal, String idTipoFoto) async {
    var url =
        ApiServices.concatConsultaIntegradaUrl("FichasCriminais/DownloadFoto");

    var options = await AutenticacaoService.getCabecalhoRequisicao();

    var json = new Map<String, dynamic>();
    json['id'] = idIdentificacaoCriminal;
    json['idTipo'] = idTipoFoto;

    var response = await RequestsServices.postOptionsWithByteArrayResponse(
        url, json, options);

    if (response.statusCode != 200) return null;

    return response.data;
  }

//#endregion

  //#region Medidas Protetivas
  static Future<Response> consultaMedidasProtetivas(
      MedidasProtetivasConsultaUnicaViewModel model) async {
    var url =
        ApiServices.concatConsultaIntegradaUrl("MedidasProtetivas/Cadastradas");

    var options = await AutenticacaoService.getCabecalhoRequisicao();

    var responseMedidasProtetivas =
        await RequestsServices.postOptions(url, model.toJson(), options);

    if (responseMedidasProtetivas.statusCode != 200) {
      responseMedidasProtetivas.statusMessage =
          CodigosDeEstado.numeroDoStatusCode(
              responseMedidasProtetivas.statusCode);
    }

    return responseMedidasProtetivas;
  }

  //#endregion

  //#region Mandados de Prisão
  static Future<Response> buscarMandadosDePrisaoPorId(
      MandadosPrisaoModels model) async {
    var url = ApiServices.concatConsultaIntegradaUrl("MandadosPrisao/Detalhes");

    var options = await AutenticacaoService.getCabecalhoRequisicao();

    var responseMandadoDePrisao = await RequestsServices.postOptions(
        url, model.toJsonOnlyIdPessoa(), options);

    if (responseMandadoDePrisao.statusCode != 200) {
      responseMandadoDePrisao.statusMessage =
          CodigosDeEstado.numeroDoStatusCode(
              responseMandadoDePrisao.statusCode);
    }
    return responseMandadoDePrisao;
  }

  //#endregion

}
