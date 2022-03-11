class ImeiModels {
  Alerta alerta;
  Delegacia delegacia;
  bool consultaCompleta;

  ImeiModels({this.alerta, this.delegacia});

  ImeiModels.fromJson(Map<String, dynamic> json, bool consultaCompleta) {
    alerta =
        json['alerta'] != null ? new Alerta.fromJson(json['alerta']) : null;
    delegacia = json['delegacia'] != null
        ? new Delegacia.fromJson(json['delegacia'])
        : null;
    this.consultaCompleta = consultaCompleta;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.alerta != null) {
      data['alerta'] = this.alerta.toJson();
    }
    if (this.delegacia != null) {
      data['delegacia'] = this.delegacia.toJson();
    }
    return data;
  }
}

class Alerta {
  String marca;
  String modelo;
  String operadora;
  String numeroTelefone;
  String numeroSerie;
  String bo;
  String dataBo;
  String imei;
  List<Imeis> imeis;
  bool ocorrencia;
  String nome;
  String cpf;
  String rg;
  List<Contatos> contatos;
  String dataNascimento;
  String usuarioIntranet;
  String unidadeAdministrativa;

  Alerta(
      {this.marca,
      this.modelo,
      this.operadora,
      this.numeroTelefone,
      this.numeroSerie,
      this.bo,
      this.dataBo,
      this.imei,
      this.imeis,
      this.ocorrencia,
      this.nome,
      this.cpf,
      this.rg,
      this.contatos,
      this.dataNascimento,
      this.usuarioIntranet,
      this.unidadeAdministrativa});

  Alerta.fromJson(Map<String, dynamic> json) {
    marca = json['marca'];
    modelo = json['modelo'];
    operadora = json['operadora'];
    numeroTelefone = json['numeroTelefone'];
    numeroSerie = json['numeroSerie'];
    bo = json['bo'];
    dataBo = json['dataBo'];
    imei = json['imei'];
    if (json['imeis'] != null) {
      imeis = <Imeis>[];
      json['imeis'].forEach((v) {
        imeis.add(new Imeis.fromJson(v));
      });
    }
    ocorrencia = json['ocorrencia'];
    nome = json['nome'];
    cpf = json['cpf'];
    rg = json['rg'];
    if (json['contatos'] != null) {
      contatos = <Contatos>[];
      json['contatos'].forEach((v) {
        contatos.add(new Contatos.fromJson(v));
      });
    }
    dataNascimento = json['dataNascimento'];
    usuarioIntranet = json['usuarioIntranet'];
    unidadeAdministrativa = json['unidadeAdministrativa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['marca'] = this.marca;
    data['modelo'] = this.modelo;
    data['operadora'] = this.operadora;
    data['numeroTelefone'] = this.numeroTelefone;
    data['numeroSerie'] = this.numeroSerie;
    data['bo'] = this.bo;
    data['dataBo'] = this.dataBo;
    data['imei'] = this.imei;
    if (this.imeis != null) {
      data['imeis'] = this.imeis.map((v) => v.toJson()).toList();
    }
    data['ocorrencia'] = this.ocorrencia;
    data['nome'] = this.nome;
    data['cpf'] = this.cpf;
    data['rg'] = this.rg;
    if (this.contatos != null) {
      data['contatos'] = this.contatos.map((v) => v.toJson()).toList();
    }
    data['dataNascimento'] = this.dataNascimento;
    data['usuarioIntranet'] = this.usuarioIntranet;
    data['unidadeAdministrativa'] = this.unidadeAdministrativa;
    return data;
  }
}

class Imeis {
  String imei;

  Imeis({this.imei});

  Imeis.fromJson(Map<String, dynamic> json) {
    imei = json['imei'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imei'] = this.imei;
    return data;
  }
}

class Contatos {
  String nome;
  String telefone;

  Contatos({this.nome, this.telefone});

  Contatos.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    telefone = json['telefone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['telefone'] = this.telefone;
    return data;
  }
}

class Delegacia {
  String marca;
  String modelo;
  String cor;
  String numeroSerie;
  String tamanhoPolegadas;
  String processador;
  String memoria;
  String imei;
  String numeroTelefone;
  String operadora;
  Ocorrencia ocorrencia;
  String nome;
  String cpf;
  String rg;
  List<Contatos> contatos;
  String dataNascimento;
  String usuarioIntranet;
  String unidadeAdministrativa;

  Delegacia(
      {this.marca,
      this.modelo,
      this.cor,
      this.numeroSerie,
      this.tamanhoPolegadas,
      this.processador,
      this.memoria,
      this.imei,
      this.numeroTelefone,
      this.operadora,
      this.ocorrencia,
      this.nome,
      this.cpf,
      this.rg,
      this.contatos,
      this.dataNascimento,
      this.usuarioIntranet,
      this.unidadeAdministrativa});

  Delegacia.fromJson(Map<String, dynamic> json) {
    marca = json['marca'];
    modelo = json['modelo'];
    cor = json['cor'];
    numeroSerie = json['numeroSerie'];
    tamanhoPolegadas = json['tamanhoPolegadas'];
    processador = json['processador'];
    memoria = json['memoria'];
    imei = json['imei'];
    numeroTelefone = json['numeroTelefone'];
    operadora = json['operadora'];
    ocorrencia = json['ocorrencia'] != null
        ? new Ocorrencia.fromJson(json['ocorrencia'])
        : null;
    nome = json['nome'];
    cpf = json['cpf'];
    rg = json['rg'];
    if (json['contatos'] != null) {
      contatos = <Contatos>[];
      json['contatos'].forEach((v) {
        contatos.add(new Contatos.fromJson(v));
      });
    }
    dataNascimento = json['dataNascimento'];
    usuarioIntranet = json['usuarioIntranet'];
    unidadeAdministrativa = json['unidadeAdministrativa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['marca'] = this.marca;
    data['modelo'] = this.modelo;
    data['cor'] = this.cor;
    data['numeroSerie'] = this.numeroSerie;
    data['tamanhoPolegadas'] = this.tamanhoPolegadas;
    data['processador'] = this.processador;
    data['memoria'] = this.memoria;
    data['imei'] = this.imei;
    data['numeroTelefone'] = this.numeroTelefone;
    data['operadora'] = this.operadora;
    if (this.ocorrencia != null) {
      data['ocorrencia'] = this.ocorrencia.toJson();
    }
    data['nome'] = this.nome;
    data['cpf'] = this.cpf;
    data['rg'] = this.rg;
    if (this.contatos != null) {
      data['contatos'] = this.contatos.map((v) => v.toJson()).toList();
    }
    data['dataNascimento'] = this.dataNascimento;
    data['usuarioIntranet'] = this.usuarioIntranet;
    data['unidadeAdministrativa'] = this.unidadeAdministrativa;
    return data;
  }
}

class Ocorrencia {
  String tipo;
  String descricao;
  String historico;
  String enderecoFato;
  String numeroEnderecoFato;
  String complementoEnderecoFato;
  String bairro;
  String dataHoraFato;
  String latitude;
  String longitude;

  Ocorrencia(
      {this.tipo,
      this.descricao,
      this.historico,
      this.enderecoFato,
      this.numeroEnderecoFato,
      this.complementoEnderecoFato,
      this.bairro,
      this.dataHoraFato,
      this.latitude,
      this.longitude});

  Ocorrencia.fromJson(Map<String, dynamic> json) {
    tipo = json['tipo'];
    descricao = json['descricao'];
    historico = json['historico'];
    enderecoFato = json['enderecoFato'];
    numeroEnderecoFato = json['numeroEnderecoFato'];
    complementoEnderecoFato = json['complementoEnderecoFato'];
    bairro = json['bairro'];
    dataHoraFato = json['dataHoraFato'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tipo'] = this.tipo;
    data['descricao'] = this.descricao;
    data['historico'] = this.historico;
    data['enderecoFato'] = this.enderecoFato;
    data['numeroEnderecoFato'] = this.numeroEnderecoFato;
    data['complementoEnderecoFato'] = this.complementoEnderecoFato;
    data['bairro'] = this.bairro;
    data['dataHoraFato'] = this.dataHoraFato;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
