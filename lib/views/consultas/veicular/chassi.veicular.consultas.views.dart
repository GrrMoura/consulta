import 'package:consulta_integrada/controllers/consultaveicular.controllers.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/styles/widgets/progressbar.widgets.dart';
import 'package:consulta_integrada/utils/uppercasetextformatter.utils.dart';
import 'package:consulta_integrada/views-models/consulta.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChassiVeicularConsultasView extends StatefulWidget {
  ChassiVeicularConsultasView({Key key, this.model}) : super(key: key);

  final ConsultaViewModel model;

  @override
  _ChassiVeicularConsultasViewState createState() =>
      new _ChassiVeicularConsultasViewState();
}

class _ChassiVeicularConsultasViewState
    extends State<ChassiVeicularConsultasView> {
  final _consultaVeicularController = new ConsultaVeicularController();
  final _formKey = GlobalKey<FormState>();
  final _identificacaoFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pesquisarButton = Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(30),
          color: DefaultTheme.getColor(),
          child: MaterialButton(
            minWidth: 100,
            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            onPressed: () {
              if (!widget.model.ocupado && _formKey.currentState.validate()) {
                _formKey.currentState.save();
                setState(() {});

                _consultaVeicularController
                    .consultarVeiculo(context, widget.model)
                    .then((value) {
                  setState(() {});
                });
              }
            },
            child: Text("Pesquisar",
                textAlign: TextAlign.center,
                style: FontDefaultStyles.sm().copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ));

    final identificacaoTextField = Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 42),
        child: TextFormField(
          controller: _identificacaoFieldController,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.text,
          inputFormatters: <TextInputFormatter>[
            UpperCaseTextFormatter(),
            LengthLimitingTextInputFormatter(17),
          ],
          style:
              FontDefaultStyles.md_1().copyWith(letterSpacing: 1, fontSize: 20),
          cursorColor: DefaultTheme.getColor(),
          decoration: InputDecoration(
            suffixIcon: IconButton(
                padding: EdgeInsets.only(right: 5),
                onPressed: () {
                  _identificacaoFieldController.clear();
                },
                icon: Icon(
                  Icons.clear,
                  color: DefaultTheme.getColor(),
                )),
            contentPadding: EdgeInsets.fromLTRB(30, 2, 0, 2),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: DefaultTheme.getColor())),
          ),
          validator: (value) {
            if (value.isEmpty) return "Por favor, informe o chassi do veículo.";
            if (value.length <= 16) {
              return "Chassi incompleto.";
            }

            return null;
          },
          onSaved: (val) {
            widget.model.identificacao = val;
          },
        ));

    return widget.model.ocupado
        ? ProgressBarkWidget.showProgressBar()
        : DefaultTextStyle(
            style: TextStyle(color: Colors.black),
            child: LayoutBuilder(
              builder:
                  (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Form(
                            key: _formKey,
                            child: Column(children: <Widget>[
                              Text(
                                'Informe o chassi do veículo',
                                style: FontDefaultStyles.sm(),
                              ),
                              identificacaoTextField,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[pesquisarButton],
                              ),
                            ]),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }
}
