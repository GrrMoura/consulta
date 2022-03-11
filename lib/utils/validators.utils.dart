import 'package:consulta_integrada/utils/validator_cpf.dart';
import 'package:tuple/tuple.dart';

class ValidatorsUtils {
  static Tuple2<bool, String> validateCpf(String value) {
    if (value.isEmpty) {
      return Tuple2(false, "Campo 'CPF' é obrigatório");
    } else if (value.length != 14) {
      // 14 porque está sendo considerado os símbolos da máscara
      return Tuple2(false, "Campo 'CPF' necessita de 11 dígitos");
    } else if (!CPF.isValid(value)) {
      return Tuple2(false, "CPF inválido");
    }
    return Tuple2(true, "");
  }

  static Tuple2<bool, String> validateIMEI(String value) {
    if (value.isEmpty) {
      return Tuple2(false, "Campo 'IMEI' é obrigatório");
    } else if (value.length != 15) {
      return Tuple2(false, "Campo 'IMEI' necessita de 15 dígitos");
    }
    return Tuple2(true, "");
  }

  static Tuple2<bool, String> validateDate(String value) {
    if (value.isEmpty) {
      return Tuple2(false, "Campo obrigatório");
    }
    final components = value.split("/");
    if (components.length == 3) {
      final dia = int.tryParse(components[0]);
      final mes = int.tryParse(components[1]);
      final ano = int.tryParse(components[2]);
      if (dia != null && mes != null && ano != null) {
        final date = DateTime(ano, mes, dia);
        if (date.year == ano && date.month == mes && date.day == dia) {
          return Tuple2(true, "");
        }
      }
    }
    return Tuple2(false, "Data inválida");
  }

  static bool listNotNullAndNotEmpty<T>(List<T> list) {
    return list != null && list.isNotEmpty;
  }
}
