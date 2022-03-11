import 'package:intl/intl.dart';

class FormatUtils {
  static String formatarMoeda(double valor) {
    var number =
        NumberFormat.currency(locale: 'pt_BR', symbol: "R\$").format(valor);
    return number;
  }
}
