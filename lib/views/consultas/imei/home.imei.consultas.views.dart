import 'package:consulta_integrada/controllers/consultaimei.controllers.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/styles/widgets/progressbar.widgets.dart';
import 'package:consulta_integrada/utils/validators.utils.dart';
import 'package:consulta_integrada/views-models/imei.consulta.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tuple/tuple.dart';

class HomeImeiConsultasView extends StatefulWidget {
  @override
  _HomeImeiConsultasViewState createState() =>
      new _HomeImeiConsultasViewState();
}

class _HomeImeiConsultasViewState extends State<HomeImeiConsultasView> {
  final _formKey = GlobalKey<FormState>();
  final _imeiFieldController = TextEditingController();
  var model = new ImeiConsultaViewModel();
  final _consultaImeiController = new ConsultaImeiController();

  @override
  Widget build(BuildContext context) {
    final imeiTextField = Container(
        padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
        child: TextFormField(
          controller: _imeiFieldController,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(15),
          ],
          style: FontDefaultStyles.md_1().copyWith(letterSpacing: 2),
          decoration: InputDecoration(
            suffixIcon: IconButton(
                padding: EdgeInsets.only(right: 5),
                onPressed: () {
                  _imeiFieldController.clear();
                },
                icon: Icon(
                  Icons.clear,
                  color: DefaultTheme.getColor(),
                )),
            contentPadding: EdgeInsets.fromLTRB(30, 2, 0, 2),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          ),
          validator: (value) {
            Tuple2<bool, String> validateIMEIResult =
                ValidatorsUtils.validateIMEI(value);
            if (!validateIMEIResult.item1) return validateIMEIResult.item2;
            return null;
          },
          onSaved: (val) {
            model.IMEI = val;
          },
        ));

    final pesquisarButton = Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(30),
          color: DefaultTheme.getColor(),
          child: MaterialButton(
            minWidth: 100,
            padding: EdgeInsets.fromLTRB(20, 15.0, 20, 15),
            onPressed: () {
              if (!model.ocupado && _formKey.currentState.validate()) {
                _formKey.currentState.save();
                setState(() {});

                _consultaImeiController
                    .consultarImei(context, model)
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

    return model.ocupado
        ? ProgressBarkWidget.showProgressBar()
        : Center(
            child: Container(
              margin: EdgeInsets.only(top: 48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      Text(
                        'Informe um \'IMEI\' válido',
                        style: FontDefaultStyles.sm(),
                      ),
                      imeiTextField,
                      pesquisarButton,
                    ]),
                  ),
                ],
              ),
            ),
          );
  }
}
