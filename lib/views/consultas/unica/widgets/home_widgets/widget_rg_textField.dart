import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class RgTextField extends StatelessWidget {
  var model;
  RgTextField(this.model, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: TextFormField(
          keyboardType: TextInputType.number,
          style: FontDefaultStyles.sm_1(),
          inputFormatters: <TextInputFormatter>[
            LengthLimitingTextInputFormatter(9),
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: InputDecoration(
            labelStyle: FontDefaultStyles.sm_1(),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            labelText: "RG",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
          validator: (value) {
            return null;
          },
          onSaved: (val) {
            model.rg = val;
          },
        ));
  }
}
