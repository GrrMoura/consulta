import 'package:consulta_integrada/controllers/consultaunica.controllers.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/styles/widgets/progressbar.widgets.dart';
import 'package:consulta_integrada/styles/widgets/snack.widgets.dart';
import 'package:consulta_integrada/views-models/home.consulta.unica.viewmodel.dart';
import 'package:consulta_integrada/views/consultas/unica/widgets/home_widgets/widget_alcunha_textField.dart';
import 'package:consulta_integrada/views/consultas/unica/widgets/home_widgets/widget_cpf_textField.dart';
import 'package:consulta_integrada/views/consultas/unica/widgets/home_widgets/widget_data_nascimento_textField.dart';
import 'package:consulta_integrada/views/consultas/unica/widgets/home_widgets/widget_filtro_multSelect.dart';
import 'package:consulta_integrada/views/consultas/unica/widgets/home_widgets/widget_nome_mae_textField.dart';
import 'package:consulta_integrada/views/consultas/unica/widgets/home_widgets/widget_nome_pai_textfield.dart';
import 'package:consulta_integrada/views/consultas/unica/widgets/home_widgets/widget_nome_textField.dart';
import 'package:consulta_integrada/views/consultas/unica/widgets/home_widgets/widget_rg_textField.dart';

import 'package:flutter/material.dart';

class HomeUnicaConsultasView extends StatefulWidget {
  @override
  _HomeUnicaConsultasViewState createState() => _HomeUnicaConsultasViewState();
}

class _HomeUnicaConsultasViewState extends State<HomeUnicaConsultasView> {
  final _formKey = GlobalKey<FormState>();
  var model = HomeConsultaUnicaViewModel();
  var consultaUnicaController = ConsultaUnicaController();

  @override
  Widget build(BuildContext context) {
    bool seAoMenosUmaOpcaoDeFiltroEstaSelecionada() {
      if (model.opcoesSelecionadas == null ||
          model.opcoesSelecionadas.isEmpty) {
        SnackWidget.showSnackBar(
            context, "Por favor, selecione uma opção de filtro");
        return false;
      }
      return true;
    }

    //TODO: CONFIRMAR TODOS OS CASOS
    final pesquisarButton = Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(15.0),
          color: DefaultTheme.getColor(),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {
              if (!model.ocupado &&
                  _formKey.currentState.validate() &&
                  seAoMenosUmaOpcaoDeFiltroEstaSelecionada()) {
                _formKey.currentState.save();
                setState(() {});

                consultaUnicaController.consultar(context, model).then((value) {
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

    Widget _widgetHomeConsultaUnica() {
      return model.ocupado
          ? ProgressBarkWidget.showProgressBar()
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'É necessário o preenchimento de pelo menos um campo',
                          style: FontDefaultStyles.sm_1Bold(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      NomeTextField(model),
                      RgTextField(model),
                      CpfTextField(model),
                      DataNascimentoTextField(model),
                      AlcunhaTextField(model),
                      NomeMaeTextField(model),
                      NomePaiTextField(model),
                      FiltrosMultiSelect(model),
                      pesquisarButton,
                      SizedBox(
                        height: 10,
                      )
                    ]),
                  ),
                ],
              ),
            );
    }

    FutureBuilder _futureScreen() {
      return FutureBuilder(
          future: consultaUnicaController
              .carregarOpcoesFiltroPorNivelDeAcesso(model),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              //fAz desaparecer as opcoes de filtro na tela de consulta unica
              case ConnectionState.waiting:
                return _widgetHomeConsultaUnica();
                break;

              case ConnectionState.done:
                return _widgetHomeConsultaUnica();
                break;
              default:
                return ProgressBarkWidget.showProgressBar();
            }
          });
    }

    return model.opcoesFiltro.isNotEmpty
        ? _widgetHomeConsultaUnica()
        : _futureScreen();
  }
}
