class MedidaProtetivaModels {
  String processo;
  String resumo;
  String status;
  String vitima;
  String enderecoVitima;
  String telefoneCelularVitima;
  String telefoneResidencialVitima;
  String telefoneProfissionalVitima;
  String contatoUrgenciaVitima;
  String telefoneContatoUrgenciaVitima;
  String reu;
  String enderecoReu;
  String telefoneCelularReu;
  String telefoneResidencialReu;
  String telefoneProfissionalReu;
  String dataOficializacao;
  String dataRevogacao;

  MedidaProtetivaModels(
      {this.processo,
        this.resumo,
        this.status,
        this.vitima,
        this.enderecoVitima,
        this.telefoneCelularVitima,
        this.telefoneResidencialVitima,
        this.telefoneProfissionalVitima,
        this.contatoUrgenciaVitima,
        this.telefoneContatoUrgenciaVitima,
        this.reu,
        this.enderecoReu,
        this.telefoneCelularReu,
        this.telefoneResidencialReu,
        this.telefoneProfissionalReu,
        this.dataOficializacao,
        this.dataRevogacao});

  MedidaProtetivaModels.fromJson(Map<String, dynamic> json) {
    processo = json['processo'];
    resumo = json['resumo'];
    status = json['status'];
    vitima = json['vitima'];
    enderecoVitima = json['enderecoVitima'];
    telefoneCelularVitima = json['telefoneCelularVitima'];
    telefoneResidencialVitima = json['telefoneResidencialVitima'];
    telefoneProfissionalVitima = json['telefoneProfissionalVitima'];
    contatoUrgenciaVitima = json['contatoUrgenciaVitima'];
    telefoneContatoUrgenciaVitima = json['telefoneContatoUrgenciaVitima'];
    reu = json['reu'];
    enderecoReu = json['enderecoReu'];
    telefoneCelularReu = json['telefoneCelularReu'];
    telefoneResidencialReu = json['telefoneResidencialReu'];
    telefoneProfissionalReu = json['telefoneProfissionalReu'];
    dataOficializacao = json['dataOficializacao'];
    dataRevogacao = json['dataRevogacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['processo'] = this.processo;
    data['resumo'] = this.resumo;
    data['status'] = this.status;
    data['vitima'] = this.vitima;
    data['enderecoVitima'] = this.enderecoVitima;
    data['telefoneCelularVitima'] = this.telefoneCelularVitima;
    data['telefoneResidencialVitima'] = this.telefoneResidencialVitima;
    data['telefoneProfissionalVitima'] = this.telefoneProfissionalVitima;
    data['contatoUrgenciaVitima'] = this.contatoUrgenciaVitima;
    data['telefoneContatoUrgenciaVitima'] = this.telefoneContatoUrgenciaVitima;
    data['reu'] = this.reu;
    data['enderecoReu'] = this.enderecoReu;
    data['telefoneCelularReu'] = this.telefoneCelularReu;
    data['telefoneResidencialReu'] = this.telefoneResidencialReu;
    data['telefoneProfissionalReu'] = this.telefoneProfissionalReu;
    data['dataOficializacao'] = this.dataOficializacao;
    data['dataRevogacao'] = this.dataRevogacao;
    return data;
  }
}