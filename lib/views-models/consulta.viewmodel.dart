abstract class ConsultaViewModel {
  final String tipoConsulta = "";

  String identificacao;
  bool ocupado;

  ConsultaViewModel({this.identificacao, this.ocupado = false});

  ConsultaViewModel.fromJson(Map<String, dynamic> json) {
    identificacao = json['identificacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identificacao'] = this.identificacao.replaceAll("-", "");
    data['tipoConsulta'] = this.tipoConsulta;
    return data;
  }
}


//#region Consulta Veicular Models

class PlacaConsultaVeicularViewModel extends ConsultaViewModel {
  final String tipoConsulta = "P";
}

class RenavamConsultaVeicularViewModel extends ConsultaViewModel {
  final String tipoConsulta = "R";
}

class ChassiConsultaVeicularViewModel extends ConsultaViewModel {
  final String tipoConsulta = "C";
}

//#endregion

//#region Consulta CNH Models

class CpfConsultaCnhViewModel extends ConsultaViewModel {
  final String tipoConsulta = "C";
}

class RegistroConsultaCnhViewModel extends ConsultaViewModel {
  final String tipoConsulta = "R";
}

//#endregion