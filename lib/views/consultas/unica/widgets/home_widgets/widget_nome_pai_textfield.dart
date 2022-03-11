import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class NomePaiTextField extends StatelessWidget {
  var model;

  NomePaiTextField(this.model, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: TextFormField(
          keyboardType: TextInputType.text,
          style: FontDefaultStyles.sm_1(),
          decoration: InputDecoration(
            labelStyle: FontDefaultStyles.sm_1(),
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            labelText: "Nome do pai",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          ),
          validator: (value) {
            return null;
          },
          onSaved: (val) {
            model.nomePai = val;
          },
        ));
  }
}
