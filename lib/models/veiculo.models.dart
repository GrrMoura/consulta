class VeiculoModels {
  String placa;
  int renavam;
  String chassi;
  int anoFabricacao;
  String especie;
  String marcaModelo;
  String tipo;
  String cor;
  String categoria;
  Debitos debitos;
  Proprietario proprietario;
  Endereco endereco;
  bool consultaCompleta;

  VeiculoModels(
      {this.placa,
        this.renavam,
        this.chassi,
        this.anoFabricacao,
        this.especie,
        this.marcaModelo,
        this.tipo,
        this.cor,
        this.categoria,
        this.debitos,
        this.proprietario,
        this.endereco,
        this.consultaCompleta});

  VeiculoModels.fromJson(Map<String, dynamic> json, bool consultaCompleta) {
    placa = json['placa'];
    renavam = json['renavam'];
    chassi = json['chassi'];
    anoFabricacao = json['anoFabricacao'];
    especie = json['especie'];
    marcaModelo = json['marcaModelo'];
    tipo = json['tipo'];
    cor = json['cor'];
    categoria = json['categoria'];
    debitos =
    json['debitos'] != null ? new Debitos.fromJson(json['debitos']) : null;
    proprietario = json['proprietario'] != null
        ? new Proprietario.fromJson(json['proprietario'])
        : null;
    endereco = json['endereco'] != null
        ? new Endereco.fromJson(json['endereco'], consultaCompleta)
        : null;
    this.consultaCompleta = consultaCompleta;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['placa'] = this.placa;
    data['renavam'] = this.renavam;
    data['chassi'] = this.chassi;
    data['anoFabricacao'] = this.anoFabricacao;
    data['especie'] = this.especie;
    data['marcaModelo'] = this.marcaModelo;
    data['tipo'] = this.tipo;
    data['cor'] = this.cor;
    data['categoria'] = this.categoria;
    if (this.debitos != null) {
      data['debitos'] = this.debitos.toJson();
    }
    if (this.proprietario != null) {
      data['proprietario'] = this.proprietario.toJson();
    }
    if (this.endereco != null) {
      data['endereco'] = this.endereco.toJson();
    }
    return data;
  }
}

class Debitos {
  String dataLicenciamento;
  double licenciamentoAnterior;
  double totalDebitosGerais;
  double totalGeralDebitosAnteriores;
  double totalIpva;
  double totalIpvaAnterior;
  double totalLicenciamento;
  double totalMulta;
  double totalMultaAnterior;
  double totalOutros;
  double totalOutrosDebitosAnteriores;
  double totalSeguro;
  double totalSeguroAnterior;
  List<String> restricoes;

  String todasRestricoesNumaUnicaString(){
    if (restricoes.isEmpty)
      return "Nenhuma restrição encontrada";
    String todasRestricoes = "";
    restricoes.forEach((element) {
      if (element.isNotEmpty && element.trim().length > 0)
        todasRestricoes += "\n" + element.trim();
    });
    return todasRestricoes;
  }

  Debitos(
      {this.dataLicenciamento,
        this.licenciamentoAnterior,
        this.totalDebitosGerais,
        this.totalGeralDebitosAnteriores,
        this.totalIpva,
        this.totalIpvaAnterior,
        this.totalLicenciamento,
        this.totalMulta,
        this.totalMultaAnterior,
        this.totalOutros,
        this.totalOutrosDebitosAnteriores,
        this.totalSeguro,
        this.totalSeguroAnterior,
        this.restricoes});

  Debitos.fromJson(Map<String, dynamic> json) {
    dataLicenciamento = json['dataLicenciamento'];
    licenciamentoAnterior = json['licenciamentoAnterior'];
    totalDebitosGerais = json['totalDebitosGerais'];
    totalGeralDebitosAnteriores = json['totalGeralDebitosAnteriores'];
    totalIpva = json['totalIpva'];
    totalIpvaAnterior = json['totalIpvaAnterior'];
    totalLicenciamento = json['totalLicenciamento'];
    totalMulta = json['totalMulta'];
    totalMultaAnterior = json['totalMultaAnterior'];
    totalOutros = json['totalOutros'];
    totalOutrosDebitosAnteriores = json['totalOutrosDebitosAnteriores'];
    totalSeguro = json['totalSeguro'];
    totalSeguroAnterior = json['totalSeguroAnterior'];
    restricoes = json['restricoes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dataLicenciamento'] = this.dataLicenciamento;
    data['licenciamentoAnterior'] = this.licenciamentoAnterior;
    data['totalDebitosGerais'] = this.totalDebitosGerais;
    data['totalGeralDebitosAnteriores'] = this.totalGeralDebitosAnteriores;
    data['totalIpva'] = this.totalIpva;
    data['totalIpvaAnterior'] = this.totalIpvaAnterior;
    data['totalLicenciamento'] = this.totalLicenciamento;
    data['totalMulta'] = this.totalMulta;
    data['totalMultaAnterior'] = this.totalMultaAnterior;
    data['totalOutros'] = this.totalOutros;
    data['totalOutrosDebitosAnteriores'] = this.totalOutrosDebitosAnteriores;
    data['totalSeguro'] = this.totalSeguro;
    data['totalSeguroAnterior'] = this.totalSeguroAnterior;
    data['restricoes'] = this.restricoes;
    return data;
  }
}

class Proprietario {
  String nome;
  String cpf;

  Proprietario({this.nome, this.cpf});

  Proprietario.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    cpf = json['cpf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['cpf'] = this.cpf;
    return data;
  }
}

class Endereco {
  String municipio;
  String logradouro;
  String bairro;
  String cep;
  String complemento;

  Endereco(
      {this.municipio,
        this.logradouro,
        this.bairro,
        this.cep,
        this.complemento});

  Endereco.fromJson(Map<String, dynamic> json, bool consultaCompleta) {
    municipio = json['municipio'];
    if (consultaCompleta){
      logradouro = json['logradouro'];
      bairro = json['bairro'];
      cep = json['cep'];
      complemento = json['complemento'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['municipio'] = this.municipio;
    data['logradouro'] = this.logradouro;
    data['bairro'] = this.bairro;
    data['cep'] = this.cep;
    data['complemento'] = this.complemento;
    return data;
  }
}