import 'package:consulta_integrada/models/imei.models.dart';

class ObjectToStringUtils {

  static String todosImeis(List<Imeis> imeis) {
    var informacoesImei = "";
    if (imeis != null && imeis.isNotEmpty) {
      Imeis ultimoImei = imeis.last;
      imeis.forEach((element) {
        informacoesImei += "${element.imei}";
        if (element != ultimoImei) informacoesImei += "\n";
      });
    }
    return informacoesImei.isNotEmpty ? informacoesImei : "Não informado";
  }

  static String todosContatos(List<Contatos> contatos) {
    var informacoesContatos = "";

    if (contatos != null && contatos.isNotEmpty) {
      Contatos ultimoContato = contatos.last;
      contatos.forEach((element) {
        informacoesContatos += "${element.nome} - ${element.telefone}";
        if (element != ultimoContato) informacoesContatos += "\n";
      });
    }

    return informacoesContatos;
  }



}