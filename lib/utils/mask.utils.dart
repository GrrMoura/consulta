import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MaskUtils {
  static MaskTextInputFormatter maskFormatterCpf() => new MaskTextInputFormatter(mask: '###.###.###-##', filter: { "#": RegExp(r'[0-9]') });
  static MaskTextInputFormatter maskFormatterPlaca() => new MaskTextInputFormatter(mask: '###-####', filter: { "#": RegExp(r'[A-Z0-9]') });
  static MaskTextInputFormatter maskFormatterData() => new MaskTextInputFormatter(mask: '##/##/####', filter: { "#": RegExp(r'[0-9]') });
}