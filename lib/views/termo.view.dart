import 'package:consulta_integrada/controllers/termo.controllers.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/styles/widgets/appbar.widgets.dart';
import 'package:consulta_integrada/styles/widgets/dialog.widgets.dart';
import 'package:consulta_integrada/styles/widgets/progressbar.widgets.dart';
import 'package:consulta_integrada/views-models/termo.viewmodel.dart';
import 'package:consulta_integrada/views/login.view.dart';
import 'package:flutter/material.dart';

class TermoView extends StatefulWidget {
  @override
  _TermoViewState createState() => new _TermoViewState();
}

class _TermoViewState extends State<TermoView> {
  var model = new TermoViewModel();
  bool _build = false;

  //#region Build Widgets

  @override
  Widget build(BuildContext context) {
    if (!_build)
      return _futureScreen();
    else
      return _termoScreen();
  }

  FutureBuilder _futureScreen() {
    return FutureBuilder(
        future: getAceitoTermoFutureDados(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasData && snapshot.data) return LoginView();
              //return HomeView();
              return _termoScreen();

            default:
              return ProgressBarkWidget.showProgressBar();
          }
        });
  }

  Widget _termoScreen() {
    return new Scaffold(
      appBar: AppBarDefault.getAppComTitulo(titulo: model.titlePage),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 5.0),
              child: new Text(
                'Termo de responsabilidade',
                style: FontDefaultStyles.smBold(),
              ),
            ),
            new Expanded(
              flex: 1,
              child: new SingleChildScrollView(
                padding: EdgeInsets.all(20.0),
                scrollDirection: Axis.vertical,
                child: new Text(
                  model.termoConfidencialidade,
                  style: FontDefaultStyles.sm(),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
              child: Column(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        activeColor: DefaultTheme.getColor(),
                        value: model.aceitoTermo,
                        onChanged: (value) {
                          setState(() {
                            _build = true;
                            model.aceitoTermo = value;
                          });
                        }),
                    Expanded(
                      child: Text(
                          'Li e concordo com o termo de confidencialidade',
                          style: FontDefaultStyles.sm_1()),
                    ),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 5.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(30.0),
                        color: DefaultTheme.getColor(),
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width / 2,
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          onPressed: () async {
                            switch (model.aceitoTermo) {
                              case true:
                                var result =
                                    await TermoController.setPreferences(model);
                                if (result)
                                  DialogWidgets.exibirDialog(
                                      context,
                                      model.titlePage,
                                      "Ocorreu um erro ao aceitar o termo de responsabilidade. Por favor, contate os administradores.");
                                else
                                  navigationToLoginView();
                                break;
                              case false:
                                DialogWidgets.exibirDialog(
                                    context,
                                    model.titlePage,
                                    "Você deve aceitar os termos de uso antes de continuar.");
                                break;
                            }
                          },
                          child: Text("Próximo",
                              textAlign: TextAlign.center,
                              style: FontDefaultStyles.sm().copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ))
                ])
              ]),
            )
          ],
        ),
      ),
    );
  }

  //#endregion

  //#region Metodos

  Future<bool> getAceitoTermoFutureDados() async {
    //log("Token do Firebase: " + await FirebaseMessaging.instance.getToken());
    return (await TermoController.getPreferences()).aceitoTermo;
  }

  void navigationToLoginView() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginView()));
  }

  //#endregion

}
