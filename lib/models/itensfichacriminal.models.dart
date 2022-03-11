import 'package:consulta_integrada/models/paginacao.models.dart';

class ItensFichaCriminalModels {
  List<ItemFichasCriminais> fichasCriminais;
  PaginacaoModels paginacao;

  ItensFichaCriminalModels({this.fichasCriminais, this.paginacao});

  ItensFichaCriminalModels.fromJson(Map<String, dynamic> json) {
    if (json['identificacoesCriminais'] != null) {
      fichasCriminais = [];
      json['identificacoesCriminais'].forEach((v) {
        fichasCriminais.add(ItemFichasCriminais.fromJson(v));
      });
    }
    paginacao = json['paginacao'] != null
        ? new PaginacaoModels.fromJson(json['paginacao'])
        : PaginacaoModels(limite: 20, pagina: 1);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fichasCriminais != null) {
      data['identificacoesCriminais'] =
          this.fichasCriminais.map((v) => v.toJson()).toList();
    }
    if (this.paginacao != null) {
      data['paginacao'] = this.paginacao.toJson();
    }
    return data;
  }
}

class ItemFichasCriminais {
  int id;
  String nome;
  String nomeMae;
  String nomePai;
  String dataNascimento;

  ItemFichasCriminais(
      {this.id, this.nome, this.nomeMae, this.nomePai, this.dataNascimento});

  ItemFichasCriminais.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    nomeMae = json['nomeMae'];
    nomePai = json['nomePai'];
    dataNascimento = json['dataNascimento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['nomeMae'] = this.nomeMae;
    data['nomePai'] = this.nomePai;
    data['dataNascimento'] = this.dataNascimento;
    return data;
  }

  Map<String, dynamic> toJsonOnlyId() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
