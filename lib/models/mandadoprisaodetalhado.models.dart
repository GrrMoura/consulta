import 'package:consulta_integrada/models/documento.models.dart';
import 'package:consulta_integrada/models/foto.models.dart';
import 'package:consulta_integrada/models/mandadoprisaopessoa.models.dart';
import 'package:consulta_integrada/models/sinaismarcas.models.dart';

class MandadoPrisaoDetalhadoModels {
  Detalhes detalhes;

  MandadoPrisaoDetalhadoModels({this.detalhes});

  MandadoPrisaoDetalhadoModels.fromJson(Map<String, dynamic> json) {
    detalhes = json['detalhes'] != null
        ? new Detalhes.fromJson(json['detalhes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.detalhes != null) {
      data['detalhes'] = this.detalhes.toJson();
    }
    return data;
  }
}

class Detalhes {
  String alcunha;
  String corRaca;
  String dataCriacao;
  String dataNascimento;
  String descricaoOrgao;
  List<Documento> documento;
  String email;
  String escolaridade;
  String estadoCivil;
  bool flagDependenteQuimico;
  bool flagGravidez;
  bool flagLactante;
  bool flgDeficienteFisico;
  bool flgIrmaoGemeo;
  bool flgMaisRecente;
  bool checkFotos;
  List<Foto> foto;
  String link;
  String mae;
  List<MandadoPrisao> mandadoPrisao;
  String municipio;
  String nome;
  String orientacaoSexual;
  String pai;
  String pais;
  MandadoPrisaoPessoa pessoa;
  String profissao;
  String sexo;
  SinaisMarcas sinaisMarcas;
  String tipoEmprego;
  String uf;

  Detalhes(
      {this.alcunha,
      this.corRaca,
      this.dataCriacao,
      this.dataNascimento,
      this.descricaoOrgao,
      this.documento,
      this.email,
      this.escolaridade,
      this.estadoCivil,
      this.flagDependenteQuimico,
      this.flagGravidez,
      this.flagLactante,
      this.flgDeficienteFisico,
      this.flgIrmaoGemeo,
      this.flgMaisRecente,
      this.foto,
      this.link,
      this.mae,
      this.mandadoPrisao,
      this.municipio,
      this.nome,
      this.orientacaoSexual,
      this.pai,
      this.pais,
      this.pessoa,
      this.profissao,
      this.sexo,
      this.sinaisMarcas,
      this.tipoEmprego,
      this.uf,
      this.checkFotos});

  Detalhes.fromJson(Map<String, dynamic> json) {
    alcunha = json['alcunha'];
    corRaca = json['corRaca'];
    dataCriacao = json['dataCriacao'];
    dataNascimento = json['dataNascimento'];
    descricaoOrgao = json['descricaoOrgao'];
    if (json['documento'] != null) {
      documento = [];
      json['documento'].forEach((v) {
        documento.add(new Documento.fromJson(v));
      });
    }
    email = json['email'];
    escolaridade = json['escolaridade'];
    estadoCivil = json['estadoCivil'];
    flagDependenteQuimico = json['flagDependenteQuimico'];
    flagGravidez = json['flagGravidez'];
    flagLactante = json['flagLactante'];
    flgDeficienteFisico = json['flgDeficienteFisico'];
    flgIrmaoGemeo = json['flgIrmaoGemeo'];
    flgMaisRecente = json['flgMaisRecente'];
    if (json['foto'] != null || json['foto']) {
      foto = [];
      json['foto'].forEach((v) {
        foto.add(Foto.fromJson(v));
      });
      if (foto.isEmpty) {
        checkFotos = false;
      } else {
        checkFotos = true;
      }
    }

    link = json['link'];
    mae = json['mae'];
    if (json['mandadoPrisao'] != null) {
      mandadoPrisao = [];
      json['mandadoPrisao'].forEach((v) {
        mandadoPrisao.add(new MandadoPrisao.fromJson(v));
      });
    }
    municipio = json['municipio'];
    nome = json['nome'];
    orientacaoSexual = json['orientacaoSexual'];
    pai = json['pai'];
    pais = json['pais'];
    pessoa = json['pessoa'] != null
        ? new MandadoPrisaoPessoa.fromJson(json['pessoa'])
        : null;
    profissao = json['profissao'];
    sexo = json['sexo'];
    sinaisMarcas = json['sinaisMarcas'] != null
        ? new SinaisMarcas.fromJson(json['sinaisMarcas'])
        : null;
    tipoEmprego = json['tipoEmprego'];
    uf = json['uf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alcunha'] = this.alcunha;
    data['corRaca'] = this.corRaca;
    data['dataCriacao'] = this.dataCriacao;
    data['dataNascimento'] = this.dataNascimento;
    data['descricaoOrgao'] = this.descricaoOrgao;
    if (this.documento != null) {
      data['documento'] = this.documento.map((v) => v.toJson()).toList();
    }
    data['email'] = this.email;
    data['escolaridade'] = this.escolaridade;
    data['estadoCivil'] = this.estadoCivil;
    data['flagDependenteQuimico'] = this.flagDependenteQuimico;
    data['flagGravidez'] = this.flagGravidez;
    data['flagLactante'] = this.flagLactante;
    data['flgDeficienteFisico'] = this.flgDeficienteFisico;
    data['flgIrmaoGemeo'] = this.flgIrmaoGemeo;
    data['flgMaisRecente'] = this.flgMaisRecente;
    if (this.foto != null) {
      data['foto'] = this.foto.map((v) => v.toJson()).toList();
    }
    data['link'] = this.link;
    data['mae'] = this.mae;
    if (this.mandadoPrisao != null) {
      data['mandadoPrisao'] =
          this.mandadoPrisao.map((v) => v.toJson()).toList();
    }
    data['municipio'] = this.municipio;
    data['nome'] = this.nome;
    data['orientacaoSexual'] = this.orientacaoSexual;
    data['pai'] = this.pai;
    data['pais'] = this.pais;
    if (this.pessoa != null) {
      data['pessoa'] = this.pessoa.toJson();
    }
    data['profissao'] = this.profissao;
    data['sexo'] = this.sexo;
    if (this.sinaisMarcas != null) {
      data['sinaisMarcas'] = this.sinaisMarcas.toJson();
    }
    data['tipoEmprego'] = this.tipoEmprego;
    data['uf'] = this.uf;
    return data;
  }
}

class MandadoPrisao {
  String cargoServidor;
  String dataConclusao;
  String dataConfirmacaoServidor;
  String dataCriacao;
  String dataExpedicao;
  String dataExpiracaoPrisaoMandadoPrisao;
  String dataInfracao;
  String dataPrisao;
  String dataValidade;
  String dataVencimentoMandados;
  String descricaoCumprimento;
  String descricaoJustificativa;
  String descricaoLocalOcorrencia;
  String especiePrisao;
  String municipioCustodia;
  String nomeEstabelecimentoPrisional;
  String nomeMagistrado;
  String nomeServidor;
  String numeroPeca;
  String numeroPrazoPrisao;
  String numeroProcesso;
  String observacao;
  String orgaoJudiciario;
  String regimePrisional;
  String seqPeca;
  String sigilo;
  String sinteseDecisao;
  String status;
  String tempoPenaAno;
  String tempoPenaDia;
  String tempoPenaMes;
  String textoJustificativaCancelamento;
  List<TipificacaoPenal> tipificacaoPenal;
  String tipoPeca;
  String ufCustodia;

  MandadoPrisao(
      {this.cargoServidor,
      this.dataConclusao,
      this.dataConfirmacaoServidor,
      this.dataCriacao,
      this.dataExpedicao,
      this.dataExpiracaoPrisaoMandadoPrisao,
      this.dataInfracao,
      this.dataPrisao,
      this.dataValidade,
      this.dataVencimentoMandados,
      this.descricaoCumprimento,
      this.descricaoJustificativa,
      this.descricaoLocalOcorrencia,
      this.especiePrisao,
      this.municipioCustodia,
      this.nomeEstabelecimentoPrisional,
      this.nomeMagistrado,
      this.nomeServidor,
      this.numeroPeca,
      this.numeroPrazoPrisao,
      this.numeroProcesso,
      this.observacao,
      this.orgaoJudiciario,
      this.regimePrisional,
      this.seqPeca,
      this.sigilo,
      this.sinteseDecisao,
      this.status,
      this.tempoPenaAno,
      this.tempoPenaDia,
      this.tempoPenaMes,
      this.textoJustificativaCancelamento,
      this.tipificacaoPenal,
      this.tipoPeca,
      this.ufCustodia});

  MandadoPrisao.fromJson(Map<String, dynamic> json) {
    cargoServidor = json['cargoServidor'];
    dataConclusao = json['dataConclusao'];
    dataConfirmacaoServidor = json['dataConfirmacaoServidor'];
    dataCriacao = json['dataCriacao'];
    dataExpedicao = json['dataExpedicao'];
    dataExpiracaoPrisaoMandadoPrisao = json['dataExpiracaoPrisaoMandadoPrisao'];
    dataInfracao = json['dataInfracao'];
    dataPrisao = json['dataPrisao'];
    dataValidade = json['dataValidade'];
    dataVencimentoMandados = json['dataVencimentoMandados'];
    descricaoCumprimento = json['descricaoCumprimento'];
    descricaoJustificativa = json['descricaoJustificativa'];
    descricaoLocalOcorrencia = json['descricaoLocalOcorrencia'];
    especiePrisao = json['especiePrisao'];
    municipioCustodia = json['municipioCustodia'];
    nomeEstabelecimentoPrisional = json['nomeEstabelecimentoPrisional'];
    nomeMagistrado = json['nomeMagistrado'];
    nomeServidor = json['nomeServidor'];
    numeroPeca = json['numeroPeca'];
    numeroPrazoPrisao = json['numeroPrazoPrisao'];
    numeroProcesso = json['numeroProcesso'];
    observacao = json['observacao'];
    orgaoJudiciario = json['orgaoJudiciario'];
    regimePrisional = json['regimePrisional'];
    seqPeca = json['seqPeca'];
    sigilo = json['sigilo'];
    sinteseDecisao = json['sinteseDecisao'];
    status = json['status'];
    tempoPenaAno = json['tempoPenaAno'];
    tempoPenaDia = json['tempoPenaDia'];
    tempoPenaMes = json['tempoPenaMes'];
    textoJustificativaCancelamento = json['textoJustificativaCancelamento'];
    if (json['tipificacaoPenal'] != null) {
      tipificacaoPenal = <TipificacaoPenal>[];
      json['tipificacaoPenal'].forEach((v) {
        tipificacaoPenal.add(TipificacaoPenal.fromJson(v));
      });
    }
    tipoPeca = json['tipoPeca'];
    ufCustodia = json['ufCustodia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['cargoServidor'] = this.cargoServidor;
    data['dataConclusao'] = this.dataConclusao;
    data['dataConfirmacaoServidor'] = this.dataConfirmacaoServidor;
    data['dataCriacao'] = this.dataCriacao;
    data['dataExpedicao'] = this.dataExpedicao;
    data['dataExpiracaoPrisaoMandadoPrisao'] =
        this.dataExpiracaoPrisaoMandadoPrisao;
    data['dataInfracao'] = this.dataInfracao;
    data['dataPrisao'] = this.dataPrisao;
    data['dataValidade'] = this.dataValidade;
    data['dataVencimentoMandados'] = this.dataVencimentoMandados;
    data['descricaoCumprimento'] = this.descricaoCumprimento;
    data['descricaoJustificativa'] = this.descricaoJustificativa;
    data['descricaoLocalOcorrencia'] = this.descricaoLocalOcorrencia;
    data['especiePrisao'] = this.especiePrisao;
    data['municipioCustodia'] = this.municipioCustodia;
    data['nomeEstabelecimentoPrisional'] = this.nomeEstabelecimentoPrisional;
    data['nomeMagistrado'] = this.nomeMagistrado;
    data['nomeServidor'] = this.nomeServidor;
    data['numeroPeca'] = this.numeroPeca;
    data['numeroPrazoPrisao'] = this.numeroPrazoPrisao;
    data['numeroProcesso'] = this.numeroProcesso;
    data['observacao'] = this.observacao;
    data['orgaoJudiciario'] = this.orgaoJudiciario;
    data['regimePrisional'] = this.regimePrisional;
    data['seqPeca'] = this.seqPeca;
    data['sigilo'] = this.sigilo;
    data['sinteseDecisao'] = this.sinteseDecisao;
    data['status'] = this.status;
    data['tempoPenaAno'] = this.tempoPenaAno;
    data['tempoPenaDia'] = this.tempoPenaDia;
    data['tempoPenaMes'] = this.tempoPenaMes;
    data['textoJustificativaCancelamento'] =
        this.textoJustificativaCancelamento;
    if (this.tipificacaoPenal != null) {
      data['tipificacaoPenal'] =
          this.tipificacaoPenal.map((v) => v.toJson()).toList();
    }
    data['tipoPeca'] = this.tipoPeca;
    data['ufCustodia'] = this.ufCustodia;
    return data;
  }
}

class TipificacaoPenal {
  String rotuloTipificacaoPenal;
  bool flgCrimeTentado;
  bool flgViolenciaDomestica;
  bool flgMulher;
  bool flgCriancaAdolescente;
  bool flgIdoso;
  String nomeCategoriaTipificacaoPenal;
  String rotuloCategoria;
  String descricaoCategoriaTipificacaoPenal;

  TipificacaoPenal(
      {this.rotuloTipificacaoPenal,
      this.flgCrimeTentado,
      this.flgViolenciaDomestica,
      this.flgMulher,
      this.flgCriancaAdolescente,
      this.flgIdoso,
      this.nomeCategoriaTipificacaoPenal,
      this.rotuloCategoria,
      this.descricaoCategoriaTipificacaoPenal});

  TipificacaoPenal.fromJson(Map<String, dynamic> json) {
    rotuloTipificacaoPenal = json['rotuloTipificacaoPenal'];
    flgCrimeTentado = json['flgCrimeTentado'];
    flgViolenciaDomestica = json['flgViolenciaDomestica'];
    flgMulher = json['flgMulher'];
    flgCriancaAdolescente = json['flgCriancaAdolescente'];
    flgIdoso = json['flgIdoso'];
    nomeCategoriaTipificacaoPenal = json['nomeCategoriaTipificacaoPenal'];
    rotuloCategoria = json['rotuloCategoria'];
    descricaoCategoriaTipificacaoPenal =
        json['descricaoCategoriaTipificacaoPenal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['rotuloTipificacaoPenal'] = this.rotuloTipificacaoPenal;
    data['flgCrimeTentado'] = this.flgCrimeTentado;
    data['flgViolenciaDomestica'] = this.flgViolenciaDomestica;
    data['flgMulher'] = this.flgMulher;
    data['flgCriancaAdolescente'] = this.flgCriancaAdolescente;
    data['flgIdoso'] = this.flgIdoso;
    data['nomeCategoriaTipificacaoPenal'] = this.nomeCategoriaTipificacaoPenal;
    data['rotuloCategoria'] = this.rotuloCategoria;
    data['descricaoCategoriaTipificacaoPenal'] =
        this.descricaoCategoriaTipificacaoPenal;
    return data;
  }
}
