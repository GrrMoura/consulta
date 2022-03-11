class MandadoPrisaoPessoa {
  String dataCadastro;
  String dataExpiracaoMandadoPrisao;
  String dataUltimaEdicao;
  String dataVencimentosMandados;
  bool flgAtivo;
  String justificativa;
  String municipioCustodia;
  String numeroIndividuo;
  String statusPessoa;
  String ufCustodia;

  MandadoPrisaoPessoa(
      {this.dataCadastro,
        this.dataExpiracaoMandadoPrisao,
        this.dataUltimaEdicao,
        this.dataVencimentosMandados,
        this.flgAtivo,
        this.justificativa,
        this.municipioCustodia,
        this.numeroIndividuo,
        this.statusPessoa,
        this.ufCustodia});

  MandadoPrisaoPessoa.fromJson(Map<String, dynamic> json) {
    dataCadastro = json['dataCadastro'];
    dataExpiracaoMandadoPrisao = json['dataExpiracaoMandadoPrisao'];
    dataUltimaEdicao = json['dataUltimaEdicao'];
    dataVencimentosMandados = json['dataVencimentosMandados'];
    flgAtivo = json['flgAtivo'];
    justificativa = json['justificativa'];
    municipioCustodia = json['municipioCustodia'];
    numeroIndividuo = json['numeroIndividuo'];
    statusPessoa = json['statusPessoa'];
    ufCustodia = json['ufCustodia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dataCadastro'] = this.dataCadastro;
    data['dataExpiracaoMandadoPrisao'] = this.dataExpiracaoMandadoPrisao;
    data['dataUltimaEdicao'] = this.dataUltimaEdicao;
    data['dataVencimentosMandados'] = this.dataVencimentosMandados;
    data['flgAtivo'] = this.flgAtivo;
    data['justificativa'] = this.justificativa;
    data['municipioCustodia'] = this.municipioCustodia;
    data['numeroIndividuo'] = this.numeroIndividuo;
    data['statusPessoa'] = this.statusPessoa;
    data['ufCustodia'] = this.ufCustodia;
    return data;
  }
}
