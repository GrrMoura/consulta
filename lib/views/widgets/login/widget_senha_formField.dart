import 'package:consulta_integrada/controllers/login_controller.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SenhaTextField extends StatefulWidget {
  SenhaTextField(this.model, {Key key}) : super(key: key);
  var model;
  TextEditingController ctrlSenha = TextEditingController();

  @override
  State<SenhaTextField> createState() => _SenhaTextFieldState();
}

class _SenhaTextFieldState extends State<SenhaTextField> {
  bool _escondeSenha = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: TextFormField(
          obscureText: _escondeSenha,
          style: FontDefaultStyles.sm(),
          decoration: InputDecoration(
            suffixIcon: IconButton(
                padding: EdgeInsets.only(right: 10),
                splashRadius: 20,
                onPressed: () {
                  if (widget.model.ocupado == false) {
                    setState(() {
                      _escondeSenha = !_escondeSenha;
                      Future.delayed(Duration(seconds: 6)).then((_) => {
                            setState(() {
                              _escondeSenha = true;
                              print(_escondeSenha);
                            })
                          });
                    });
                  } else {
                    return null;
                  }
                },
                icon: Icon(
                    _escondeSenha ? Icons.visibility_off : Icons.visibility)),
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            labelText: "Senha",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
          validator: (value) {
            if (value.isEmpty) {
              return "Campo 'senha' é obrigatório'";
            }
            return null;
          },
          onSaved: (val) {
            LoginController.setSenha(val);
            widget.model.senha = val;
          },
        ));
  }
}
