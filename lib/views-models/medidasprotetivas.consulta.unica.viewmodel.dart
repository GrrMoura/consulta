import 'package:consulta_integrada/models/medidaprotetiva.models.dart';
import 'package:consulta_integrada/models/paginacao.models.dart';
import 'package:consulta_integrada/views-models/consulta.unica.viewmodel.dart';

class MedidasProtetivasConsultaUnicaViewModel extends ConsultaUnicaViewModel {
  List<MedidaProtetivaModels> medidasProtetivas;
  PaginacaoModels paginacao;

  MedidasProtetivasConsultaUnicaViewModel(
      {nome,
      rg,
      cpf,
      alcunha,
      nomePai,
      nomeMae,
      dataNascimento,
      this.medidasProtetivas,
      this.paginacao})
      : super(
            nome: nome,
            rg: rg,
            cpf: cpf,
            alcunha: alcunha,
            nomePai: nomePai,
            nomeMae: nomeMae,
            dataNascimento: dataNascimento);

  MedidasProtetivasConsultaUnicaViewModel.fromJson(Map<String, dynamic> json) {
    if (json['medidasProtetivas'] != null) {
      medidasProtetivas = [];
      json['medidasProtetivas'].forEach((v) {
        medidasProtetivas.add(new MedidaProtetivaModels.fromJson(v));
      });
    }
    paginacao = json['paginacao'] != null
        ? new PaginacaoModels.fromJson(json['paginacao'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['rg'] = this.rg;
    data['cpf'] = this.cpf;
    data['alcunha'] = this.alcunha;
    data['nomePai'] = this.nomePai;
    data['nomeMae'] = this.nomeMae;
    data['dataNascimento'] = this.dataNascimento;
    if (this.paginacao != null) {
      data['paginacao'] = this.paginacao.toJson();
    }
    return data;
  }
}

