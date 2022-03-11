import 'package:consulta_integrada/models/itensidentificacaocriminal.models.dart';
import 'package:consulta_integrada/models/paginacao.models.dart';
import 'package:consulta_integrada/views-models/consulta.unica.viewmodel.dart';

class IdentificacaoCriminalConsultaUnicaViewModel extends ConsultaUnicaViewModel {

  ItensIdentificacaoCriminalModels itensIdentificacaoCriminalModels;
  PaginacaoModels paginacao;

  IdentificacaoCriminalConsultaUnicaViewModel(
      {nome, rg, cpf, alcunha, nomePai, nomeMae, dataNascimento, this.itensIdentificacaoCriminalModels, this.paginacao})
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
    data['NomeIndiciado'] = this.nome;
    data['rg'] = this.rg;
    data['cpf'] = this.cpf;
    data['apelido'] = this.alcunha;
    data['nomePai'] = this.nomePai;
    data['nomeMae'] = this.nomeMae;
    data['dataNascimento'] = this.dataNascimento;
    if (this.paginacao != null) {
      data['paginacao'] = this.paginacao.toJson();
    }
    return data;
  }
}