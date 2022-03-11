import 'package:consulta_integrada/controllers/consultaunica.controllers.dart';
import 'package:consulta_integrada/models/mandadosprisao.models.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/styles/widgets/appbar.widgets.dart';
import 'package:consulta_integrada/styles/widgets/divider.widgets.dart';
import 'package:consulta_integrada/views-models/mandadoprisao.consulta.unica.viewmodel.dart';
import 'package:flutter/material.dart';

class ListaMandadosPrisaoUnicaConsultasView extends StatefulWidget {
  final MandadoPrisaoConsultaUnicaViewModel model;
  ListaMandadosPrisaoUnicaConsultasView({Key key, this.model})
      : super(key: key);

  @override
  _ListaMandadosPrisaoUnicaConsultasViewState createState() =>
      new _ListaMandadosPrisaoUnicaConsultasViewState();
}

class _ListaMandadosPrisaoUnicaConsultasViewState
    extends State<ListaMandadosPrisaoUnicaConsultasView> {
  var consultaUnicaController = new ConsultaUnicaController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildRow(MandadosPrisaoModels item) {
    return InkWell(
      onTap: () {
        setState(() {});
        consultaUnicaController
            .buscarMandadosDePrisaoPorId(context, item)
            .then((value) {
          setState(() {});
        });
      },
      child: Column(children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10.0),
          child: Row(children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(item.nome.trim(), style: FontDefaultStyles.smBold()),
                  Text(
                    "Mãe: ${item.nomeMae}",
                    style: FontDefaultStyles.sm_1(),
                  ),
                  Text(
                    "Pai: ${item.nomePai}",
                    style: FontDefaultStyles.sm_1(),
                  ),
                  Text(
                    "Data Nascimento: ${item.dataNascimento}",
                    style: FontDefaultStyles.sm_1(),
                  ),
                  Text(
                    "Status: ${item.statusPessoa}",
                    style: FontDefaultStyles.sm_1Bold(),
                  )
                ],
              ),
            ),
            Container(
              height: 28.0,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: DefaultTheme.getColor(),
              ),
            ),
          ]),
        ),
        DividerWidgets.get()
      ]),
    );
  }

  Widget _listViewScreen() {
    return Scaffold(
      appBar:
          AppBarDefault.getAppComTitulo(titulo: "Resultado Mandado de Prisão"),
      body: Center(
        child: ListView.builder(
          itemCount: widget.model.mandadosPrisao.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return _buildRow(widget.model.mandadosPrisao[index]);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _listViewScreen();
  }
}
