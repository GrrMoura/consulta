import 'package:consulta_integrada/controllers/login_controller.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/widgets/dialog.widgets.dart';
import 'package:consulta_integrada/styles/widgets/snack.widgets.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BotaoTouch extends StatefulWidget {
  var model;

  BotaoTouch(this.model, {Key key}) : super(key: key);

  @override
  State<BotaoTouch> createState() => _BotaoTouchState();
}

class _BotaoTouchState extends State<BotaoTouch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
          Widget>[
        Text("Touch ID", style: FontDefaultStyles.sm_1Bold()),
        Switch(
            value: widget.model.usarLeitorBiometrico,
            onChanged: (value) async {
              setState(() {
                widget.model.usarLeitorBiometrico = value;
              });
              if (value) {
                bool funciona =
                    await LoginController.testandoSeBiometriaFunciona(context);
                if (funciona) {
                  DialogWidgets.exibirDialog(context, "Leitor biométrico",
                      "O leitor biométrico será utilizado no próximo login.");
                } else {
                  SnackWidget.showSnackBar(context,
                      "Desculpe. Seu dispositivo não suporta leitura biométrica.");
                  await Future.delayed(Duration(seconds: 2)).then((_) => {
                        setState(() {
                          widget.model.usarLeitorBiometrico = false;
                          LoginController.setValorDaOpcaoDeLeituraBiometrica(
                              false);
                        })
                      });
                }
              } else {
                LoginController.setValorDaOpcaoDeLeituraBiometrica(value);
              }
            },
            activeTrackColor: Colors.green,
            activeColor: Colors.white),
      ]),
    );
  }
}
