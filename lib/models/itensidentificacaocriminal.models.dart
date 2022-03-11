import 'package:consulta_integrada/models/paginacao.models.dart';

class ItensIdentificacaoCriminalModels {
  List<ItemIdentificacoesCriminais> identificacoesCriminais;
  PaginacaoModels paginacao;

  ItensIdentificacaoCriminalModels({this.identificacoesCriminais, this.paginacao});

  ItensIdentificacaoCriminalModels.fromJson(Map<String, dynamic> json) {
    if (json['fichasCriminais'] != null) {
      identificacoesCriminais = [];
      json['fichasCriminais'].forEach((v) {
        identificacoesCriminais.add(new ItemIdentificacoesCriminais.fromJson(v));
      });
    }
    paginacao = json['paginacao'] != null
        ? new PaginacaoModels.fromJson(json['paginacao'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.identificacoesCriminais != null) {
      data['fichasCriminais'] =
          this.identificacoesCriminais.map((v) => v.toJson()).toList();
    }
    if (this.paginacao != null) {
      data['paginacao'] = this.paginacao.toJson();
    }
    return data;
  }
}


class ItemIdentificacoesCriminais {
  String id;
  String nomeIndiciado;
  String nomeMae;
  String nomePai;
  String dataNascimento;
  String cpf;

  ItemIdentificacoesCriminais(
      {this.id,
        this.nomeIndiciado,
        this.nomeMae,
        this.nomePai,
        this.dataNascimento,
        this.cpf});

  ItemIdentificacoesCriminais.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomeIndiciado = json['nomeIndiciado'];
    nomeMae = json['nomeMae'];
    nomePai = json['nomePai'];
    dataNascimento = json['dataNascimento'];
    cpf = json['cpf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nomeIndiciado'] = this.nomeIndiciado;
    data['nomeMae'] = this.nomeMae;
    data['nomePai'] = this.nomePai;
    data['dataNascimento'] = this.dataNascimento;
    data['cpf'] = this.cpf;
    return data;
  }

  Map<String, dynamic> toJsonOnlyId() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }

}