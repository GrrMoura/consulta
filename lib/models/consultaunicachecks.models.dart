// ignore_for_file: non_constant_identifier_names

class ConsultaUnicaChecksModels {
  // Checks da API
  bool CheckIdentCivil;
  bool CheckIdentCriminal;
  bool CheckFichaCriminal;
  bool CheckMedidaProtetiva;
  bool CheckMandadoPrisao;

//TODO: CHECK BOX AQUI
  ConsultaUnicaChecksModels(
      {this.CheckIdentCivil = false,
      this.CheckIdentCriminal = false,
      this.CheckFichaCriminal = false,
      this.CheckMedidaProtetiva = false,
      this.CheckMandadoPrisao = false});
}
