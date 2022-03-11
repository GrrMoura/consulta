import 'package:consulta_integrada/controllers/consultaunica.controllers.dart';
import 'package:consulta_integrada/models/itensidentificacaocriminal.models.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/styles/widgets/appbar.widgets.dart';
import 'package:consulta_integrada/styles/widgets/divider.widgets.dart';
import 'package:consulta_integrada/utils/validators.utils.dart';
import 'package:consulta_integrada/views-models/identificacaocriminal.consulta.unica.viewmodel.dart';
import 'package:flutter/material.dart';

class ListaIdentificacaoCriminalUnicaConsultasView extends StatefulWidget {
  final IdentificacaoCriminalConsultaUnicaViewModel model;
  ListaIdentificacaoCriminalUnicaConsultasView({Key key, this.model})
      : super(key: key);

  @override
  _ListaIdentificacaoCriminalUnicaConsultasViewState createState() =>
      new _ListaIdentificacaoCriminalUnicaConsultasViewState();
}

class _ListaIdentificacaoCriminalUnicaConsultasViewState
    extends State<ListaIdentificacaoCriminalUnicaConsultasView> {
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
            .buscarIdentificacoesCriminais(context, widget.model)
            .then((value) {
          setState(() {});
        });
      }
    }
  }

  Widget _buildRow(ItemIdentificacoesCriminais item) {
    return InkWell(
      onTap: () {
        setState(() {});
        consultaUnicaController
            .buscarIdentificacaoCriminalPorId(context, item)
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
                  Text(item.nomeIndiciado, style: FontDefaultStyles.smBold()),
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
              padding: const EdgeInsets.all(0.0),
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
      appBar: AppBarDefault.getAppComTitulo(
          titulo: "Resultado Identificação Criminal"),
      body: Center(
        child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.model.itensIdentificacaoCriminalModels
              .identificacoesCriminais.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return _buildRow(widget.model.itensIdentificacaoCriminalModels
                .identificacoesCriminais[index]);
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
          future: consultaUnicaController.buscarIdentificacoesCriminais(
              context, widget.model),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return ValidatorsUtils.listNotNullAndNotEmpty(widget
                        .model
                        .itensIdentificacaoCriminalModels
                        .identificacoesCriminais)
                    ? _listViewScreen()
                    : _homeViewScreen();
                break;
              default:
                return _homeViewScreen();
            }
          });
    }

    return ValidatorsUtils.listNotNullAndNotEmpty(widget
            .model.itensIdentificacaoCriminalModels.identificacoesCriminais)
        ? _listViewScreen()
        : _futureScreen();
  }
}
