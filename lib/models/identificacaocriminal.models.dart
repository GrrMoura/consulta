import 'dart:typed_data';

class IdentificacaoCriminalModels {
  IdentificacaoCriminal identificacaoCriminal;
  FotoIdentificacaoCriminal fotoFrente;
  FotoIdentificacaoCriminal fotoLado;

  IdentificacaoCriminalModels(
      {this.identificacaoCriminal, this.fotoFrente, this.fotoLado});

  IdentificacaoCriminalModels.fromJson(Map<String, dynamic> json) {
    identificacaoCriminal = json['fichaCriminal'] != null
        ? new IdentificacaoCriminal.fromJson(json['fichaCriminal'])
        : null;
    fotoFrente = json['fotoFrente'] != null
        ? new FotoIdentificacaoCriminal.fromJson(json['fotoFrente'])
        : null;
    fotoLado = json['fotoLado'] != null
        ? new FotoIdentificacaoCriminal.fromJson(json['fotoLado'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.identificacaoCriminal != null) {
      data['fichaCriminal'] = this.identificacaoCriminal.toJson();
    }
    if (this.fotoFrente != null) {
      data['fotoFrente'] = this.fotoFrente.toJson();
    }
    if (this.fotoLado != null) {
      data['fotoLado'] = this.fotoLado.toJson();
    }
    return data;
  }
}

class IdentificacaoCriminal {
  String id;
  String codigoProcesso;
  String descricaoProcesso;
  String numeroInqueritoPolicial;
  String dataAutuacao;
  String nomeIndiciado;
  String nomePai;
  String nomeMae;
  String nomeSexo;
  String dataNascimento;
  String nomeLocalNascimento;
  String nomeUFNascimento;
  String nomeNacionalidade;
  String dataHoraCadastro;
  String rg;
  String orgaoExpedidorRg;
  String cpf;
  String titulo;
  String profissao;
  String endereco;
  String enderecoComercial;
  String nomeVitima;
  String infracaoPenal;
  String apelido;
  String cidade;
  String delegacia;

  IdentificacaoCriminal(
      {this.id,
      this.codigoProcesso,
      this.descricaoProcesso,
      this.numeroInqueritoPolicial,
      this.dataAutuacao,
      this.nomeIndiciado,
      this.nomePai,
      this.nomeMae,
      this.nomeSexo,
      this.dataNascimento,
      this.nomeLocalNascimento,
      this.nomeUFNascimento,
      this.nomeNacionalidade,
      this.dataHoraCadastro,
      this.rg,
      this.orgaoExpedidorRg,
      this.cpf,
      this.titulo,
      this.profissao,
      this.endereco,
      this.enderecoComercial,
      this.nomeVitima,
      this.infracaoPenal,
      this.apelido,
      this.cidade,
      this.delegacia});

  IdentificacaoCriminal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    codigoProcesso = json['codigoProcesso'];
    descricaoProcesso = json['descricaoProcesso'];
    numeroInqueritoPolicial = json['numeroInqueritoPolicial'];
    dataAutuacao = json['dataAutuacao'];
    nomeIndiciado = json['nomeIndiciado'];
    nomePai = json['nomePai'];
    nomeMae = json['nomeMae'];
    nomeSexo = json['nomeSexo'];
    dataNascimento = json['dataNascimento'];
    nomeLocalNascimento = json['nomeLocalNascimento'];
    nomeUFNascimento = json['nomeUFNascimento'];
    nomeNacionalidade = json['nomeNacionalidade'];
    dataHoraCadastro = json['dataHoraCadastro'];
    rg = json['rg'];
    orgaoExpedidorRg = json['orgaoExpedidorRg'];
    cpf = json['cpf'];
    titulo = json['titulo'];
    profissao = json['profissao'];
    endereco = json['endereco'];
    enderecoComercial = json['enderecoComercial'];
    nomeVitima = json['nomeVitima'];
    infracaoPenal = json['infracaoPenal'];
    apelido = json['apelido'];
    cidade = json['cidade'];
    delegacia = json['delegacia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['codigoProcesso'] = this.codigoProcesso;
    data['descricaoProcesso'] = this.descricaoProcesso;
    data['numeroInqueritoPolicial'] = this.numeroInqueritoPolicial;
    data['dataAutuacao'] = this.dataAutuacao;
    data['nomeIndiciado'] = this.nomeIndiciado;
    data['nomePai'] = this.nomePai;
    data['nomeMae'] = this.nomeMae;
    data['nomeSexo'] = this.nomeSexo;
    data['dataNascimento'] = this.dataNascimento;
    data['nomeLocalNascimento'] = this.nomeLocalNascimento;
    data['nomeUFNascimento'] = this.nomeUFNascimento;
    data['nomeNacionalidade'] = this.nomeNacionalidade;
    data['dataHoraCadastro'] = this.dataHoraCadastro;
    data['rg'] = this.rg;
    data['orgaoExpedidorRg'] = this.orgaoExpedidorRg;
    data['cpf'] = this.cpf;
    data['titulo'] = this.titulo;
    data['profissao'] = this.profissao;
    data['endereco'] = this.endereco;
    data['enderecoComercial'] = this.enderecoComercial;
    data['nomeVitima'] = this.nomeVitima;
    data['infracaoPenal'] = this.infracaoPenal;
    data['apelido'] = this.apelido;
    data['cidade'] = this.cidade;
    data['delegacia'] = this.delegacia;
    return data;
  }
}

class FotoIdentificacaoCriminal {
  String idTipo;
  String contentType;
  Uint8List foto;
  FotoIdentificacaoCriminal({this.idTipo, this.contentType});
  //TODO: DIMINUIR O TAMANHO DAS FOTOS NA API.

  FotoIdentificacaoCriminal.fromJson(Map<String, dynamic> json) {
    idTipo = json['idTipo'];
    contentType = json['contentType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idTipo'] = this.idTipo;
    data['contentType'] = this.contentType;
    return data;
  }
}
