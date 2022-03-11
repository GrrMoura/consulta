import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/utils/mask.utils.dart';
import 'package:consulta_integrada/utils/validators.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tuple/tuple.dart';

// ignore: camel_case_types, must_be_immutable
class CpfTextField extends StatelessWidget {
  var model;
  CpfTextField(this.model, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: TextFormField(
          keyboardType: TextInputType.number,
          style: FontDefaultStyles.sm_1(),
          inputFormatters: <TextInputFormatter>[MaskUtils.maskFormatterCpf()],
          decoration: InputDecoration(
            labelStyle: FontDefaultStyles.sm_1(),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            labelText: "CPF",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
          validator: (value) {
            if (value != null && value.isNotEmpty) {
              Tuple2<bool, String> validatorCpfResult =
                  ValidatorsUtils.validateCpf(value);
              if (!validatorCpfResult.item1) return validatorCpfResult.item2;
            }
            return null;
          },
          onSaved: (val) {
            model.cpf = val;
          },
        ));
  }
}
