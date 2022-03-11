import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class NomeMaeTextField extends StatelessWidget {
  var model;
  NomeMaeTextField(this.model, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: TextFormField(
          keyboardType: TextInputType.text,
          style: FontDefaultStyles.sm_1(),
          decoration: InputDecoration(
            labelStyle: FontDefaultStyles.sm_1(),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            labelText: "Nome da mãe",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
          validator: (value) {
            return null;
          },
          onSaved: (val) {
            model.nomeMae = val;
          },
        ));
  }
}
