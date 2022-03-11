import 'package:consulta_integrada/models/mandadosprisao.models.dart';
import 'package:consulta_integrada/views-models/home.consulta.unica.viewmodel.dart';

import 'consultaunicachecks.models.dart';

class ConsultaUnicaModels extends ConsultaUnicaChecksModels {
  int totalMedidasProtetivas;
  int totalCidadaos;
  int totalFichasCriminais;
  int totalIdentificacoesCriminais;
  int totalMandadosPrisao;
  List<MandadosPrisaoModels> mandadosPrisao;

  ConsultaUnicaModels(
      {this.totalMedidasProtetivas,
        this.totalCidadaos,
        this.totalFichasCriminais,
        this.totalIdentificacoesCriminais,
        this.totalMandadosPrisao});

  ConsultaUnicaModels.fromJsonViewModel(Map<String, dynamic> json, HomeConsultaUnicaViewModel model) {
    totalMedidasProtetivas = json['totalMedidasProtetivas'];
    totalCidadaos = json['totalCidadaos'];
    totalFichasCriminais = json['totalFichasCriminais'];
    totalIdentificacoesCriminais = json['totalIdentificacoesCriminais'];
    totalMandadosPrisao = json['totalMandadosPrisao'];

    if (json['mandadosPrisao'] != null) {
      mandadosPrisao = [];
      json['mandadosPrisao'].forEach((v) {
        mandadosPrisao.add(new MandadosPrisaoModels.fromJson(v));
      });
    }

    this.CheckIdentCivil = model.CheckIdentCivil;
    this.CheckIdentCriminal = model.CheckIdentCriminal;
    this.CheckFichaCriminal = model.CheckFichaCriminal;
    this.CheckMedidaProtetiva = model.CheckMedidaProtetiva;
    this.CheckMandadoPrisao = model.CheckMandadoPrisao;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalMedidasProtetivas'] = this.totalMedidasProtetivas;
    data['totalCidadaos'] = this.totalCidadaos;
    data['totalFichasCriminais'] = this.totalFichasCriminais;
    data['totalIdentificacoesCriminais'] = this.totalIdentificacoesCriminais;
    data['totalMandadosPrisao'] = this.totalMandadosPrisao;
    return data;
  }
}