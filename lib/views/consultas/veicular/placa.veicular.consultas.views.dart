import 'package:consulta_integrada/controllers/consultaveicular.controllers.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/styles/widgets/progressbar.widgets.dart';
import 'package:consulta_integrada/utils/mask.utils.dart';
import 'package:consulta_integrada/utils/uppercasetextformatter.utils.dart';
import 'package:consulta_integrada/views-models/consulta.viewmodel.dart';
import 'package:flutter/material.dart';

class PlacaVeicularConsultasView extends StatefulWidget {
  PlacaVeicularConsultasView({Key key, this.model}) : super(key: key);

  final ConsultaViewModel model;

  @override
  _PlacaVeicularConsultasViewState createState() =>
      new _PlacaVeicularConsultasViewState();
}

class _PlacaVeicularConsultasViewState
    extends State<PlacaVeicularConsultasView> {
  final _consultaVeicularController = new ConsultaVeicularController();
  final _formKey = GlobalKey<FormState>();
  final _identificacaoFieldController = TextEditingController();
  final heightBox = 35;

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
    //daqui vai pra linha70
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
          controller: _identificacaoFieldController, //vai pra linha 102
          textAlign: TextAlign.center,
          keyboardType: TextInputType.text,
          inputFormatters: [
            UpperCaseTextFormatter(),
            MaskUtils.maskFormatterPlaca()
          ],
          style: FontDefaultStyles.md_1(),
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
            contentPadding: EdgeInsets.fromLTRB(35, 2, 0, 2),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: DefaultTheme.getColor())),
          ),
          validator: (value) {
            if (value.isEmpty) return "Por favor, informe a placa do veículo.";
            if (value.length != 8) return "Placa incompleta.";
            return null;
          },
          onSaved: (val) {
            widget.model.identificacao = val;
          },
        ));

    return widget.model.ocupado // vai pra dio_mixin e volta pra pesquisar
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
                          padding: const EdgeInsets.all(10),
                          child: Form(
                            key: _formKey,
                            child: Column(children: <Widget>[
                              Text(
                                'Informe a placa do veículo',
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
