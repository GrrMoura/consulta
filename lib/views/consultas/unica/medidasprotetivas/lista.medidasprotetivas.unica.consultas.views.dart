import 'package:consulta_integrada/controllers/consultaunica.controllers.dart';
import 'package:consulta_integrada/models/medidaprotetiva.models.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/styles/widgets/appbar.widgets.dart';
import 'package:consulta_integrada/styles/widgets/divider.widgets.dart';
import 'package:consulta_integrada/utils/validators.utils.dart';
import 'package:consulta_integrada/views-models/medidasprotetivas.consulta.unica.viewmodel.dart';
import 'package:consulta_integrada/views/consultas/unica/medidasprotetivas/detalhes.medidaprotetiva.unica.consultas.views.dart';
import 'package:flutter/material.dart';

class ListaMedidasProtetivasUnicaConsultasView extends StatefulWidget {
  final MedidasProtetivasConsultaUnicaViewModel model;
  ListaMedidasProtetivasUnicaConsultasView({Key key, this.model})
      : super(key: key);

  @override
  _ListaMedidasProtetivasUnicaConsultasViewtate createState() =>
      new _ListaMedidasProtetivasUnicaConsultasViewtate();
}

class _ListaMedidasProtetivasUnicaConsultasViewtate
    extends State<ListaMedidasProtetivasUnicaConsultasView> {
  ScrollController _scrollController;
  var consultaUnicaController = new ConsultaUnicaController();

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  // Controle do scroll: ao final do scroll é carregado novos elementos
  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (widget.model.paginacao == null ||
          !widget.model.paginacao.seChegouAoFinalDaPagina()) {
        setState(() {});
        consultaUnicaController
            .buscarMedidasProtetivas(context, widget.model)
            .then((value) {
          setState(() {});
        });
      }
    }
  }

  Widget _buildRow(MedidaProtetivaModels item) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                DetalhesMedidaProtetivaUnicaConsultasView(model: item)));
      },
      child: Column(children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10.0),
          child: Row(children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(item.reu, style: FontDefaultStyles.smBold()),
                  Text(
                    "Processo: ${item.processo}",
                    style: FontDefaultStyles.sm_1(),
                  ),
                  Text(
                    "Status ${item.status}",
                    style: FontDefaultStyles.sm_1(),
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
          AppBarDefault.getAppComTitulo(titulo: "Resultado Medidas Protetivas"),
      body: Center(
        child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.model.medidasProtetivas.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return _buildRow(widget.model.medidasProtetivas[index]);
          },
        ),
      ),
    );
  }

  Widget _homeViewScreen() {
    return Scaffold(
      appBar: AppBarDefault.getAppComTitulo(titulo: "Carregando. Aguarde..."),
    );
  }

  @override
  Widget build(BuildContext context) {
    FutureBuilder _futureScreen() {
      return FutureBuilder(
          future: consultaUnicaController.buscarMedidasProtetivas(
              context, widget.model),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return ValidatorsUtils.listNotNullAndNotEmpty(
                        widget.model.medidasProtetivas)
                    ? _listViewScreen()
                    : _homeViewScreen();
                break;
              default:
                return _homeViewScreen();
            }
          });
    }

    return ValidatorsUtils.listNotNullAndNotEmpty(
            widget.model.medidasProtetivas)
        ? _listViewScreen()
        : _futureScreen();
  }
}
