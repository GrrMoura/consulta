import 'package:consulta_integrada/models/consultaunicachecks.models.dart';
import 'package:consulta_integrada/models/opcao.models.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class HomeConsultaUnicaViewModel extends ConsultaUnicaChecksModels {
  // Campos da view
  String nome;
  String rg;
  String cpf;
  String alcunha;
  String nomePai;
  String nomeMae;
  String numeroProceso;
  String dataNascimento;
  bool ocupado;
  List<OpcaoModels> opcoesFiltro;
  List<OpcaoModels> opcoesSelecionadas;
  List<MultiSelectItem> items;

  HomeConsultaUnicaViewModel(
      {this.nome,
      this.rg,
      this.cpf,
      this.alcunha,
      this.nomePai,
      this.nomeMae,
      this.numeroProceso,
      this.dataNascimento,
      this.ocupado = false,
      this.opcoesFiltro,
      this.items}) {
    opcoesFiltro = [];
    opcoesSelecionadas = [];
    items = [];
    this.CheckIdentCivil = false;
    this.CheckIdentCriminal = false;
    this.CheckFichaCriminal = false;
    this.CheckMedidaProtetiva = false;
    this.CheckMandadoPrisao = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['rg'] = this.rg;
    data['cpf'] = this.cpf;
    data['alcunha'] = this.alcunha;
    data['nomePai'] = this.nomePai;
    data['nomeMae'] = this.nomeMae;
    data['numero'] = this.numeroProceso;
    data['dataNascimento'] = this.dataNascimento;
    data['CheckIdentCivil'] = this.CheckIdentCivil;
    data['CheckIdentCriminal'] = this.CheckIdentCriminal;
    data['CheckFichaCriminal'] = this.CheckFichaCriminal;
    data['CheckMedidaProtetiva'] = this.CheckMedidaProtetiva;
    data['CheckMandadoPrisao'] = this.CheckMandadoPrisao;
    return data;
  }
}
