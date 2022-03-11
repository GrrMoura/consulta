// ignore_for_file: must_be_immutable

import 'package:consulta_integrada/controllers/login_controller.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/utils/mask.utils.dart';
import 'package:consulta_integrada/utils/validators.utils.dart';
import 'package:consulta_integrada/views-models/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class UsuarioTextField extends StatelessWidget {
  UsuarioTextField(this.model, this.ctrl, {Key key}) : super(key: key);
  TextEditingController ctrl;
  var model = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(5, 45, 5, 5),
        child: TextFormField(
          controller: ctrl,
          inputFormatters: [MaskUtils.maskFormatterCpf()],
          keyboardType: TextInputType.number,
          style: FontDefaultStyles.sm(),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            labelText: "Usuário",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
          ),
          validator: (value) {
            Tuple2<bool, String> validatorCpfResult =
                ValidatorsUtils.validateCpf(value);
            if (!validatorCpfResult.item1) return validatorCpfResult.item2;
            return null;
          },
          onSaved: (val) {
            LoginController.setLogin(val);
            model.login = val;
          },
        ));
  }
}
