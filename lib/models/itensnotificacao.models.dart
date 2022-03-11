import 'package:consulta_integrada/models/notificacao.models.dart';
import 'package:consulta_integrada/models/paginacao.models.dart';

class ItensNotificacaoModels {
  List<NotificacaoModels> notificacoes;
  PaginacaoModels paginacao;
  int naoVisualizadas;

  ItensNotificacaoModels(
      {this.notificacoes, this.paginacao, this.naoVisualizadas});

  ItensNotificacaoModels.fromJson(Map<String, dynamic> json) {
    if (json['cadastradas'] != null) {
      notificacoes = [];
      json['cadastradas'].forEach((v) {
        notificacoes.add(new NotificacaoModels.fromJson(v));
      });
    }
    paginacao = json['paginacao'] != null
        ? new PaginacaoModels.fromJson(json['paginacao'])
        : null;
    naoVisualizadas = json['naoVisualizadas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notificacoes != null) {
      data['cadastradas'] = this.notificacoes.map((v) => v.toJson()).toList();
    }
    if (this.paginacao != null) {
      data['paginacao'] = this.paginacao.toJson();
    }
    data['naoVisualizadas'] = this.naoVisualizadas;
    return data;
  }
}