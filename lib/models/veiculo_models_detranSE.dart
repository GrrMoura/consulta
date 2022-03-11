class VeiculoModelsDetran {
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
  String dataUltimoCRV;
  Proprietario proprietario;
  Endereco endereco;
  bool baseDetran;
  bool consultaCompleta;
  List<String> restricoes;

  VeiculoModelsDetran(
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
      this.consultaCompleta,
      this.dataUltimoCRV,
      this.baseDetran,
      this.restricoes});

  VeiculoModelsDetran.fromJson(
      Map<String, dynamic> json, bool consultaCompleta) {
    if (json['dadosDetran'] != null) {
      baseDetran = true;
      placa = json['dadosDetran']['placa'];
      renavam = json['dadosDetran']['renavam'];
      chassi = json['dadosDetran']['chassi'];
      anoFabricacao = json['dadosDetran']['anoFabricacao'];
      especie = json['dadosDetran']['especie'];
      marcaModelo = json['dadosDetran']['marcaModelo'];
      tipo = json['dadosDetran']['tipo'];
      cor = json['dadosDetran']['cor'];
      categoria = json['dadosDetran']['categoria'];
      dataUltimoCRV = json['dadosDetran']['dataLicenciamento'];

      if (json['dadosDetran']['debitos'] != null) {
        debitos = Debitos.fromJson(json['dadosDetran']['debitos']);
      } else {
        debitos = null;
      }

      if (json['dadosDetran']['proprietario'] != null) {
        proprietario =
            Proprietario.fromJson(json['dadosDetran']['proprietario']);
      } else {
        proprietario = null;
      }

      if (json['dadosDetran']['endereco'] != null) {
        if (consultaCompleta == true) {
          endereco = Endereco.fromJson(json['dadosDetran']['endereco'], true);
        } else {
          endereco = Endereco.fromJson(json['dadosDetran']['endereco'], false);
        }
      } else {
        endereco = null;
      }
      this.consultaCompleta = consultaCompleta;
    } else {
      baseDetran = false;
    }
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
    data['dataUltimoCRV'] = this.dataUltimoCRV;

    if (this.restricoes != null) {
      data['restricoes'] = this.restricoes;
    }

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

  String todasRestricoesNumaUnicaString() {
    if (restricoes.isEmpty || restricoes.length <= 0)
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

    if (json["restricoes"] != null) {
      restricoes = [];
      json["restricoes"].forEach(
        (v) {
          restricoes.add(v);
        },
      );
    }
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
  String enderecoCompleto;
  Endereco({
    this.municipio,
    this.logradouro,
    this.bairro,
    this.cep,
    this.complemento,
  });

  Endereco.fromJson(Map<String, dynamic> json, bool consultaCompleta) {
    if (consultaCompleta == true) {
      municipio = json['municipio'];
      logradouro = json['logradouro'];
      bairro = json['bairro'];
      complemento = json['complemento'];
      cep = json['cep'];
      // enderecoCompleto = logradouro + complemento + bairro + municipio + cep;
    } else {
      municipio = json['municipio'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['municipio'] = this.municipio;
    data['logradouro'] = this.municipio;
    data['bairro'] = this.bairro;
    data['complemento'] = this.complemento;
    data['cep'] = this.cep;
    return data;
  }
}
