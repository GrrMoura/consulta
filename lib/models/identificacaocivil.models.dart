import 'dart:typed_data';

import 'package:consulta_integrada/models/filiacao.models.dart';

class IdentificacaoCivilModels {
  int id;
  String nome;
  List<Filiacao> filiacoes;
  int idMidiaFoto;
  String cpf;
  String rg;
  String dataExpedicao;
  String dataNascimento;
  String naturalidade;
  String rua;
  String endereco;
  String complemento;
  String bairro;
  String cidadeEndereco;
  String ufEndereco;
  String estadoCivil;
  String escolaridade;
  String profissao;
  String sexo;
  Uint8List foto;

  IdentificacaoCivilModels(
      {this.id,
      this.nome,
      this.filiacoes,
      this.idMidiaFoto,
      this.cpf,
      this.rg,
      this.dataExpedicao,
      this.dataNascimento,
      this.naturalidade,
      this.rua,
      this.endereco,
      this.complemento,
      this.bairro,
      this.cidadeEndereco,
      this.ufEndereco,
      this.estadoCivil,
      this.escolaridade,
      this.profissao,
      this.sexo});

  IdentificacaoCivilModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    if (json['filiacoes'] != null) {
      filiacoes = [];
      json['filiacoes'].forEach((v) {
        filiacoes.add(Filiacao.fromJson(v));
      });
    }

    idMidiaFoto = json['idMidiaFoto'];
    cpf = json['cpf'];
    rg = json['rg'];
    dataExpedicao = json['dataExpedicao'];
    dataNascimento = json['dataNascimento'];
    naturalidade = json['naturalidade'];
    rua = json['rua'];
    endereco = json['endereco'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    cidadeEndereco = json['cidadeEndereco'];
    ufEndereco = json['ufEndereco'];
    estadoCivil = json['estadoCivil'];
    escolaridade = json['escolaridade'];
    profissao = json['profissao'];
    sexo = json['sexo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    if (this.filiacoes != null) {
      data['filiacoes'] = this.filiacoes.map((v) => v.toJson()).toList();
    }
    data['idMidiaFoto'] = this.idMidiaFoto;
    data['cpf'] = this.cpf;
    data['rg'] = this.rg;
    data['dataExpedicao'] = this.dataExpedicao;
    data['dataNascimento'] = this.dataNascimento;
    data['naturalidade'] = this.naturalidade;
    data['rua'] = this.rua;
    data['endereco'] = this.endereco;
    data['complemento'] = this.complemento;
    data['bairro'] = this.bairro;
    data['cidadeEndereco'] = this.cidadeEndereco;
    data['ufEndereco'] = this.ufEndereco;
    data['estadoCivil'] = this.estadoCivil;
    data['escolaridade'] = this.escolaridade;
    data['profissao'] = this.profissao;
    data['sexo'] = this.sexo;
    return data;
  }

  Map<String, dynamic> toJsonIdMidiaFoto() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idMidia'] = this.idMidiaFoto;
    return data;
  }

  String getFiliacoes() {
    if (this.filiacoes == null || this.filiacoes.isEmpty)
      return "Nenhuma restrição encontrada";

    var todasFiliacoes = "";
    var ultimaFiliacao = filiacoes.last;

    filiacoes.forEach((f) {
      todasFiliacoes += "${f.descricaoFiliacao}: ${f.nomeFiliacao}";
      if (f != ultimaFiliacao) todasFiliacoes += "\n";
    });

    return todasFiliacoes;
  }
}
