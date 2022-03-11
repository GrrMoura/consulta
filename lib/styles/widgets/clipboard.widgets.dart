import 'package:consulta_integrada/styles/widgets/snack.widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClipBoardWidget {
  static void setValue(BuildContext context, String value){
    Clipboard.setData(new ClipboardData(text: value));
    SnackWidget.showSnackBar(context, 'Copiado para área de transferência');
  }
}