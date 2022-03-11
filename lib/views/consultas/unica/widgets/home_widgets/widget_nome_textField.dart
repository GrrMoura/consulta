import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NomeTextField extends StatelessWidget {
  var model;
  NomeTextField(this.model, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: TextFormField(
          keyboardType: TextInputType.text,
          style: FontDefaultStyles.sm_1(),
          decoration: InputDecoration(
            labelStyle: FontDefaultStyles.sm_1(),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            labelText: "Nome",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
          validator: (value) {
            return null;
          },
          onSaved: (val) {
            model.nome = val;
          },
        ));
  }
}
