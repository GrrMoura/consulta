import 'package:consulta_integrada/models/opcao.models.dart';

class OpcaoConsultaUnicaModels {

  static OpcaoModels opcaoIdentificacaoCivil() => OpcaoModels(id: 1, nome: "Identificação Civil");

  static OpcaoModels opcaoIdentificacaoCriminal() => OpcaoModels(id: 2, nome: "Identificação Criminal");

  static OpcaoModels opcaoFichaCriminal() => OpcaoModels(id: 3, nome: "Ficha Criminal");

  static OpcaoModels opcaoMandadoDePrisao() => OpcaoModels(id: 4, nome: "Mandado de Prisão");

  static OpcaoModels opcaoMedidasProtetivas() => OpcaoModels(id: 5, nome: "Medidas Protetivas");

}