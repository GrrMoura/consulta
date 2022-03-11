import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/views-models/home.consulta.unica.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class BoxFormFieldHomeUnica extends StatelessWidget {
  var _label;
  var _model = HomeConsultaUnicaViewModel();

  TextInputType _textInputType;
  TextInputFormatter formatter;

  BoxFormFieldHomeUnica(this._label, this._model, this._textInputType,
      {Key key})
      : super(key: key);

  BoxFormFieldHomeUnica.formatter(
      this._label, this._model, this._textInputType, this.formatter,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: TextFormField(
          keyboardType: _textInputType,
          inputFormatters: [formatter],
          style: FontDefaultStyles.sm_1(),
          decoration: InputDecoration(
            labelStyle: FontDefaultStyles.sm_1(),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            labelText: _label,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          ),
          validator: (value) {
            return null;
          },
          onSaved: (val) {
            if (_model.nome != null) {
              _model.nome = val;
            }

            if (_model.rg != null) {
              _model.rg = val;
            }
          },
        ));
  }
}
