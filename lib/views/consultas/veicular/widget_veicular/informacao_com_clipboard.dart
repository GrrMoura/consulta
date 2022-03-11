import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/styles/widgets/clipboard.widgets.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InformacaoComClipboard extends StatelessWidget {
  var value;
  InformacaoComClipboard(this.value, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        flex: 200,
        child: Text(
          value,
          style: FontDefaultStyles.smBold(),
        ),
      ),
      Spacer(
        flex: 5,
      ),
      Container(
        padding: const EdgeInsets.all(0.0),
        height: 28.0,
        child: IconButton(
            iconSize: 16.0,
            icon: Icon(
              Icons.copy,
              color: DefaultTheme.getColor(),
            ),
            onPressed: () {
              ClipBoardWidget.setValue(context, value);
            }),
      ),
    ]);
  }
}
