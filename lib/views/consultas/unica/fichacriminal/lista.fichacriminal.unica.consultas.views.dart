import 'package:consulta_integrada/controllers/consultaunica.controllers.dart';
import 'package:consulta_integrada/models/itensfichacriminal.models.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/styles/widgets/appbar.widgets.dart';
import 'package:consulta_integrada/styles/widgets/divider.widgets.dart';
import 'package:consulta_integrada/utils/validators.utils.dart';
import 'package:consulta_integrada/views-models/fichacriminal.consulta.unica.viewmodel.dart';
import 'package:flutter/material.dart';

class ListaFichaCriminalUnicaConsultasView extends StatefulWidget {
  final FichaCriminalConsultaUnicaViewModel model;
  ListaFichaCriminalUnicaConsultasView({Key key, this.model}) : super(key: key);

  @override
  _ListaFichaCriminalUnicaConsultasViewState createState() =>
      new _ListaFichaCriminalUnicaConsultasViewState();
}

class _ListaFichaCriminalUnicaConsultasViewState
    extends State<ListaFichaCriminalUnicaConsultasView> {
  var x;
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
            .buscarFichasCriminais(context, widget.model)
            .then((value) {
          setState(() {});
        });
      }
    }
  }

  Widget _buildRow(ItemFichasCriminais item) {
    return InkWell(
      onTap: () {
        setState(() {});
        consultaUnicaController
            .buscarFichaCriminalPorId(context, item)
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
                  Text(item.nome, style: FontDefaultStyles.smBold()),
                  Text(
                    "Mãe: ${item.nomeMae}",
                    style: FontDefaultStyles.sm_1(),
                  ),
                  Text(
                    "Data Nascimento: ${item.dataNascimento}",
                    style: FontDefaultStyles.sm_1(),
                  )
                ],
              ),
            ),
            Container(
              height: 28,
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
      appBar: AppBarDefault.getAppComTitulo(titulo: "Resultado Ficha Criminal"),
      body: Center(
        child: ListView.builder(
          controller: _scrollController,
          itemCount:
              widget.model.itensFichasCriminalModels.fichasCriminais.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return _buildRow(
                widget.model.itensFichasCriminalModels.fichasCriminais[index]);
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
          future: consultaUnicaController.buscarFichasCriminais(
              context, widget.model),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return ValidatorsUtils.listNotNullAndNotEmpty(
                        widget.model.itensFichasCriminalModels.fichasCriminais)
                    ? _listViewScreen()
                    : _homeViewScreen();
                break;
              default:
                return _homeViewScreen();
            }
          });
    }

    return ValidatorsUtils.listNotNullAndNotEmpty(
            widget.model.itensFichasCriminalModels.fichasCriminais)
        ? _listViewScreen()
        : _futureScreen();
  }
}
