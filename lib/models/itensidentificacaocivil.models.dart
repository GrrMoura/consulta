import 'package:consulta_integrada/models/cidadao.models.dart';
import 'package:consulta_integrada/models/paginacao.models.dart';

class ItensIdentificacaoCivilModels {
  List<Cidadao> cidadaos;
  PaginacaoModels paginacao;

  ItensIdentificacaoCivilModels({this.cidadaos, this.paginacao});

  ItensIdentificacaoCivilModels.fromJson(Map<String, dynamic> json) {
    if (json['cidadaos'] != null) {
      cidadaos = [];
      json['cidadaos'].forEach((v) {
        cidadaos.add(Cidadao.fromJson(v));
      });
    }
    paginacao = json['paginacao'] != null
        ? new PaginacaoModels.fromJson(json['paginacao'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cidadaos != null) {
      data['cidadaos'] = this.cidadaos.map((v) => v.toJson()).toList();
    }
    if (this.paginacao != null) {
      data['paginacao'] = this.paginacao.toJson();
    }
    return data;
  }
}
