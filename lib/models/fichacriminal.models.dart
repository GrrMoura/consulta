class FichaCriminalModels {
  int id;
  String apelido;
  String nome;
  String nomeMae;
  String nomePai;
  String rg;
  String dataNascimento;
  String naturalidade;
  String ufNaturalidade;
  String rua;
  String complemento;
  String bairro;
  String cidadeEndereco;
  String ufEndereco;
  String dataInclusao;
  String estadoCivil;
  String escolaridade;
  String profissao;
  String sexo;
  String cor;
  List<ProcessosCriminais> processosCriminais;

  FichaCriminalModels(
      {this.id,
      this.apelido,
      this.nome,
      this.nomeMae,
      this.nomePai,
      this.rg,
      this.dataNascimento,
      this.naturalidade,
      this.ufNaturalidade,
      this.rua,
      this.complemento,
      this.bairro,
      this.cidadeEndereco,
      this.ufEndereco,
      this.dataInclusao,
      this.estadoCivil,
      this.escolaridade,
      this.profissao,
      this.sexo,
      this.cor,
      this.processosCriminais});

  FichaCriminalModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    apelido = json['apelido'];
    nome = json['nome'];
    nomeMae = json['nomeMae'];
    nomePai = json['nomePai'];
    rg = json['rg'];
    dataNascimento = json['dataNascimento'];
    naturalidade = json['naturalidade'];
    ufNaturalidade = json['ufNaturalidade'];
    rua = json['rua'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    cidadeEndereco = json['cidadeEndereco'];
    ufEndereco = json['ufEndereco'];
    dataInclusao = json['dataInclusao'];
    estadoCivil = json['estadoCivil'];
    escolaridade = json['escolaridade'];
    profissao = json['profissao'];
    sexo = json['sexo'];
    cor = json['cor'];

    if (json['processosCriminais'] != null) {
      processosCriminais = <ProcessosCriminais>[];
      json['processosCriminais'].forEach((v) {
        processosCriminais.add(new ProcessosCriminais.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['apelido'] = this.apelido;
    data['nome'] = this.nome;
    data['nomeMae'] = this.nomeMae;
    data['nomePai'] = this.nomePai;
    data['rg'] = this.rg;
    data['dataNascimento'] = this.dataNascimento;
    data['naturalidade'] = this.naturalidade;
    data['ufNaturalidade'] = this.ufNaturalidade;
    data['rua'] = this.rua;
    data['complemento'] = this.complemento;
    data['bairro'] = this.bairro;
    data['cidadeEndereco'] = this.cidadeEndereco;
    data['ufEndereco'] = this.ufEndereco;
    data['dataInclusao'] = this.dataInclusao;
    data['estadoCivil'] = this.estadoCivil;
    data['escolaridade'] = this.escolaridade;
    data['profissao'] = this.profissao;
    data['sexo'] = this.sexo;
    data['cor'] = this.cor;
    if (this.processosCriminais != null) {
      data['processosCriminais'] =
          this.processosCriminais.map((v) => v.toJson()).toList();
    }
    return data;
  }

  String getSexo() {
    if (this.sexo != null && this.sexo.isNotEmpty) {
      switch (this.sexo) {
        case "M":
          return "Masculino";
        case "F":
          return "Feminino";
        default:
          return this.sexo;
      }
    }
    return "Não informado";
  }
}

class ProcessosCriminais {
  int idProcesso;
  String numeroProcesso;
  String inquerito;
  String delegacia;
  String tipificacao1;
  String tipificacao2;
  String tipificacao3;
  String tipificacao4;
  String tipificacao5;
  String tipificacao6;
  String enderecoOcorrencia;
  String complementoOcorrencia;
  String bairroOcorrencia;
  String cidadeOcorrencia;
  String estadoOcorrencia;
  String dataOcorrencia;
  String ocorrencia;
  List<BaixasProcessos> baixasProcessos;

  ProcessosCriminais(
      {this.idProcesso,
      this.numeroProcesso,
      this.inquerito,
      this.delegacia,
      this.tipificacao1,
      this.tipificacao2,
      this.tipificacao3,
      this.tipificacao4,
      this.tipificacao5,
      this.tipificacao6,
      this.enderecoOcorrencia,
      this.complementoOcorrencia,
      this.bairroOcorrencia,
      this.cidadeOcorrencia,
      this.estadoOcorrencia,
      this.dataOcorrencia,
      this.ocorrencia,
      this.baixasProcessos});

  ProcessosCriminais.fromJson(Map<String, dynamic> json) {
    idProcesso = json['idProcesso'];
    numeroProcesso = json['numeroProcesso'];
    inquerito = json['inquerito'];
    delegacia = json['delegacia'];
    tipificacao1 = json['tipificacao1'];
    tipificacao2 = json['tipificacao2'];
    tipificacao3 = json['tipificacao3'];
    tipificacao4 = json['tipificacao4'];
    tipificacao5 = json['tipificacao5'];
    tipificacao6 = json['tipificacao6'];
    enderecoOcorrencia = json['enderecoOcorrencia'];
    complementoOcorrencia = json['complementoOcorrencia'];
    bairroOcorrencia = json['bairroOcorrencia'];
    cidadeOcorrencia = json['cidadeOcorrencia'];
    estadoOcorrencia = json['estadoOcorrencia'];
    dataOcorrencia = json['dataOcorrencia'];
    ocorrencia = json['ocorrencia'];
    if (json['baixasProcessos'] != null) {
      baixasProcessos = <BaixasProcessos>[];
      json['baixasProcessos'].forEach((v) {
        baixasProcessos.add(new BaixasProcessos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idProcesso'] = this.idProcesso;
    data['numeroProcesso'] = this.numeroProcesso;
    data['inquerito'] = this.inquerito;
    data['delegacia'] = this.delegacia;
    data['tipificacao1'] = this.tipificacao1;
    data['tipificacao2'] = this.tipificacao2;
    data['tipificacao3'] = this.tipificacao3;
    data['tipificacao4'] = this.tipificacao4;
    data['tipificacao5'] = this.tipificacao5;
    data['tipificacao6'] = this.tipificacao6;
    data['enderecoOcorrencia'] = this.enderecoOcorrencia;
    data['complementoOcorrencia'] = this.complementoOcorrencia;
    data['bairroOcorrencia'] = this.bairroOcorrencia;
    data['cidadeOcorrencia'] = this.cidadeOcorrencia;
    data['estadoOcorrencia'] = this.estadoOcorrencia;
    data['dataOcorrencia'] = this.dataOcorrencia;
    data['ocorrencia'] = this.ocorrencia;
    if (this.baixasProcessos != null) {
      data['baixasProcessos'] =
          this.baixasProcessos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BaixasProcessos {
  int idProcesso;
  int idBaixa;
  String dataBaixa;
  String dataSentenca;
  String motivoBaixa;
  String condenacaoBaixa;
  String observacoesBaixa1;
  String observacoesBaixa2;

  BaixasProcessos(
      {this.idProcesso,
      this.idBaixa,
      this.dataBaixa,
      this.dataSentenca,
      this.motivoBaixa,
      this.condenacaoBaixa,
      this.observacoesBaixa1,
      this.observacoesBaixa2});

  BaixasProcessos.fromJson(Map<String, dynamic> json) {
    idProcesso = json['idProcesso'];
    idBaixa = json['idBaixa'];
    dataBaixa = json['dataBaixa'];
    dataSentenca = json['dataSentenca'];
    motivoBaixa = json['motivoBaixa'];
    condenacaoBaixa = json['condenacaoBaixa'];
    observacoesBaixa1 = json['observacoesBaixa1'];
    observacoesBaixa2 = json['observacoesBaixa2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idProcesso'] = this.idProcesso;
    data['idBaixa'] = this.idBaixa;
    data['dataBaixa'] = this.dataBaixa;
    data['dataSentenca'] = this.dataSentenca;
    data['motivoBaixa'] = this.motivoBaixa;
    data['condenacaoBaixa'] = this.condenacaoBaixa;
    data['observacoesBaixa1'] = this.observacoesBaixa1;
    data['observacoesBaixa2'] = this.observacoesBaixa2;
    return data;
  }
}
