class VeiculoModelsNacional {
  String placa;
  int renavam;
  String chassi;
  String anoFabricacao;
  String especie;
  String marcaModelo;
  String tipo;
  String cor;
  String categoria;
  String dataUltimoCRV;
  Proprietario proprietario;
  Possuidor possuidor;
  Endereco endereco;
  bool baseNacional;
  bool consultaCompleta;

  VeiculoModelsNacional({
    this.placa,
    this.renavam,
    this.chassi,
    this.anoFabricacao,
    this.especie,
    this.marcaModelo,
    this.tipo,
    this.cor,
    this.categoria,
    this.proprietario,
    this.endereco,
    this.consultaCompleta,
    this.dataUltimoCRV,
    this.baseNacional,
  });

  VeiculoModelsNacional.fromJson(
      Map<String, dynamic> json, bool consultaCompleta) {
    if (json['dadosNacionais'] != null) {
      baseNacional = true;
      placa = json['dadosNacionais']['placa'];
      renavam = json['dadosNacionais']['renavam'];
      chassi = json['dadosNacionais']['chassi'];
      anoFabricacao = json['dadosNacionais']['anoFabricacao'];
      especie = json['dadosNacionais']['especie'];
      marcaModelo = json['dadosNacionais']['marcaModelo'];
      tipo = json['dadosNacionais']['tipoVeiculo'];
      cor = json['dadosNacionais']['cor'];
      categoria = json['dadosNacionais']['categoria'];
      dataUltimoCRV = json['dadosNacionais']['dataEmissaoUltimoCRV'];

      if (json['dadosNacionais']['proprietario'] != null) {
        proprietario =
            Proprietario.fromJson(json['dadosNacionais']['proprietario']);
      } else {
        proprietario = null;
      }

      endereco = Endereco.fromJson(json['dadosNacionais']);

      // if (consultaCompleta == true) {
      //   endereco =
      //       Endereco.fromJson(json['dadosNacionais']['enderecoCompleto']);
      // } else {
      //   endereco = null;
      // }

      if (json['dadosNacionais']['possuidor'] != null) {
        possuidor = Possuidor.fromJson(json['dadosNacionais']['possuidor']);
      } else {
        proprietario = null;
      }

      this.consultaCompleta = consultaCompleta;
    } else {
      baseNacional = false;
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

    if (this.proprietario != null) {
      data['proprietario'] = this.proprietario.toJson();
    }
    if (this.endereco != null) {
      data['endereco'] = this.endereco.toJson();
    }
    return data;
  }
}

class Proprietario {
  String nome;
  String cpf;

  Proprietario({this.nome, this.cpf});

  Proprietario.fromJson(Map<String, dynamic> json) {
    nome = json['nomeProprietario'];
    cpf = json['numeroDocumentoProprietario'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['cpf'] = this.cpf;

    return data;
  }
}

class Possuidor {
  String nome;
  String cpf;

  Possuidor({this.nome, this.cpf});

  Possuidor.fromJson(Map<String, dynamic> json) {
    nome = json['nomePossuidor'];
    cpf = json['numeroDocumentoPossuidor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['cpf'] = this.cpf;

    return data;
  }
}

class Endereco {
  String enderecoCompleto;
  String municipioPlaca;

  Endereco({
    this.enderecoCompleto,
    this.municipioPlaca,
  });

  Endereco.fromJson(Map<String, dynamic> json) {
    enderecoCompleto = json['enderecoCompleto'];
    municipioPlaca = json['municipioPlaca'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enderecoCompleto'] = this.enderecoCompleto;

    return data;
  }
}
