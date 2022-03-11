import 'package:consulta_integrada/models/itensfichacriminal.models.dart';
import 'package:consulta_integrada/models/paginacao.models.dart';
import 'package:consulta_integrada/views-models/consulta.unica.viewmodel.dart';

class FichaCriminalConsultaUnicaViewModel extends ConsultaUnicaViewModel {
  ItensFichaCriminalModels itensFichasCriminalModels;
  PaginacaoModels paginacao;

  FichaCriminalConsultaUnicaViewModel(
      {nome,
      rg,
      cpf,
      alcunha,
      nomePai,
      nomeMae,
      numeroProceso,
      dataNascimento,
      this.itensFichasCriminalModels,
      this.paginacao})
      : super(
            nome: nome,
            rg: rg,
            cpf: cpf,
            alcunha: alcunha,
            nomePai: nomePai,
            nomeMae: nomeMae,
            dataNascimento: dataNascimento);

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
