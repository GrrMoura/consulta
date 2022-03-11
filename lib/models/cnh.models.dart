class CnhModels {
  String codigoRetorno;
  String prontuario;
  String registro;
  String nome;
  String numeroIdentidade;
  String orgaoIdentidade;
  String ufIdentidade;
  String cpf;
  String categoria;
  Endereco endereco;
  String dataNascimento;
  String municipioNascimento;
  String sexo;
  String nomeMae;
  String validade;
  String observacoes;
  String possuiBloqueio;
  String dataEmissao;
  bool consultaCompleta;

  CnhModels(
      {this.codigoRetorno,
        this.prontuario,
        this.registro,
        this.nome,
        this.numeroIdentidade,
        this.orgaoIdentidade,
        this.ufIdentidade,
        this.cpf,
        this.categoria,
        this.endereco,
        this.dataNascimento,
        this.municipioNascimento,
        this.sexo,
        this.nomeMae,
        this.validade,
        this.observacoes,
        this.possuiBloqueio,
        this.dataEmissao,
        this.consultaCompleta});

  CnhModels.fromJson(Map<String, dynamic> json, bool consultaCompleta) {
    codigoRetorno = json['codigoRetorno'];
    prontuario = json['prontuario'];
    registro = json['registro'];
    nome = json['nome'];
    numeroIdentidade = json['numeroIdentidade'];
    orgaoIdentidade = json['orgaoIdentidade'];
    ufIdentidade = json['ufIdentidade'];
    cpf = json['cpf'];
    categoria = json['categoria'];
    endereco = json['endereco'] != null
        ? new Endereco.fromJson(json['endereco'])
        : null;
    dataNascimento = json['dataNascimento'];
    municipioNascimento = json['municipioNascimento'];
    sexo = json['sexo'];
    nomeMae = json['nomeMae'];
    validade = json['validade'];
    observacoes = json['observacoes'];
    possuiBloqueio = json['possuiBloqueio'];
    dataEmissao = json['dataEmissao'];
    this.consultaCompleta = consultaCompleta;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigoRetorno'] = this.codigoRetorno;
    data['prontuario'] = this.prontuario;
    data['registro'] = this.registro;
    data['nome'] = this.nome;
    data['numeroIdentidade'] = this.numeroIdentidade;
    data['orgaoIdentidade'] = this.orgaoIdentidade;
    data['ufIdentidade'] = this.ufIdentidade;
    data['cpf'] = this.cpf;
    data['categoria'] = this.categoria;
    if (this.endereco != null) {
      data['endereco'] = this.endereco.toJson();
    }
    data['dataNascimento'] = this.dataNascimento;
    data['municipioNascimento'] = this.municipioNascimento;
    data['sexo'] = this.sexo;
    data['nomeMae'] = this.nomeMae;
    data['validade'] = this.validade;
    data['observacoes'] = this.observacoes;
    data['possuiBloqueio'] = this.possuiBloqueio;
    data['dataEmissao'] = this.dataEmissao;
    return data;
  }
}

class Endereco {
  String rua;
  String numero;
  String complemento;
  String bairro;
  String municipio;
  String cep;

  Endereco(
      {this.rua,
        this.numero,
        this.complemento,
        this.bairro,
        this.municipio,
        this.cep});

  Endereco.fromJson(Map<String, dynamic> json) {
    rua = json['rua'];
    numero = json['numero'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    municipio = json['municipio'];
    cep = json['cep'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rua'] = this.rua;
    data['numero'] = this.numero;
    data['complemento'] = this.complemento;
    data['bairro'] = this.bairro;
    data['municipio'] = this.municipio;
    data['cep'] = this.cep;
    return data;
  }
}