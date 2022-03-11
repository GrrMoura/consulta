import 'package:consulta_integrada/models/notificacao.models.dart';
import 'package:consulta_integrada/models/paginacao.models.dart';
import 'package:consulta_integrada/services/api.services.dart';
import 'package:consulta_integrada/services/autenticacao.services.dart';
import 'package:consulta_integrada/services/requests.services.dart';
import 'package:consulta_integrada/utils/configuracoesglobal.utils.dart';
import 'package:dio/dio.dart';

class NotificacaoServices {

  static Future<Response> buscarNotificacoes(PaginacaoModels paginacaoModels) async {
    var url = ApiServices.concatIntranetUrl("Notificacoes/CadastradasMobile");

    var options = await AutenticacaoService.getCabecalhoRequisicao();

    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdSistema'] = ConfiguracoesGlobalUtils.ID_SISTEMA;

    if (paginacaoModels != null)
      data['paginacao'] = paginacaoModels.toJson();

    var responseConsultaCompleta = await RequestsServices.postOptions(url, data, options);

    return responseConsultaCompleta;
  }


  static Future<Response> buscarNotificacaoPorId(NotificacaoModels model) async {
    var url = ApiServices.concatIntranetUrl("Notificacoes/VisualizarObterComId");

    var options = await AutenticacaoService.getCabecalhoRequisicao();

    var responseConsultaCompleta = await RequestsServices.postOptions(url, model.toJsonOnlyId(), options);

    return responseConsultaCompleta;
  }


}