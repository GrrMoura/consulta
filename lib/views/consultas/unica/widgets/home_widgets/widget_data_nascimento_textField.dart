import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/utils/mask.utils.dart';
import 'package:consulta_integrada/utils/validators.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tuple/tuple.dart';

// ignore:must_be_immutable
class DataNascimentoTextField extends StatelessWidget {
  var model;
  DataNascimentoTextField(this.model, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: TextFormField(
          keyboardType: TextInputType.number,
          style: FontDefaultStyles.sm_1(),
          inputFormatters: <TextInputFormatter>[
            MaskUtils.maskFormatterData(),
          ],
          decoration: InputDecoration(
            labelStyle: FontDefaultStyles.sm_1(),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            labelText: "Data de nascimento",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
          validator: (value) {
            if (value != null && value.isNotEmpty) {
              Tuple2<bool, String> validatorDateResult =
                  ValidatorsUtils.validateDate(value);
              if (!validatorDateResult.item1) return validatorDateResult.item2;
            }
            return null;
          },
          onSaved: (val) {
            model.dataNascimento = val;
          },
        ));
  }
}
