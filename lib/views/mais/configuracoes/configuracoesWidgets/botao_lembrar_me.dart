import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/widgets/dialog.widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BotaoLembrarMe extends StatefulWidget {
  bool valor;
  BotaoLembrarMe(this.valor, {Key key}) : super(key: key);

  @override
  State<BotaoLembrarMe> createState() => _BotaoLembrarMeState();
}

class _BotaoLembrarMeState extends State<BotaoLembrarMe> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Lembrar-me", style: FontDefaultStyles.sm_1Bold()),
            Switch(
                value: widget.valor,
                onChanged: (value) async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  setState(() {
                    widget.valor = value;
                    prefs.setBool("lembrar_me", value);

                    if (value) {
                      DialogWidgets.exibirDialog(context, "Lembrar-me",
                          "O seu usuário será preenchido,automaticamente,no próximo login.");
                    }
                  });
                },
                activeTrackColor: Colors.green,
                activeColor: Colors.white),
          ]),
    );
  }
}
