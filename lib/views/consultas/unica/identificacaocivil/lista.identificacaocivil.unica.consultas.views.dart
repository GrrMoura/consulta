import 'package:consulta_integrada/controllers/consultaunica.controllers.dart';
import 'package:consulta_integrada/models/cidadao.models.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/styles/widgets/appbar.widgets.dart';
import 'package:consulta_integrada/styles/widgets/divider.widgets.dart';
import 'package:consulta_integrada/utils/validators.utils.dart';
import 'package:consulta_integrada/views-models/identificacaocivil.consulta.unica.viewmodel.dart';
import 'package:flutter/material.dart';

class ListaIdentificacaoCivilUnicaConsultasView extends StatefulWidget {
  final IdentificacaoCivilConsultaUnicaViewModel model;
  ListaIdentificacaoCivilUnicaConsultasView({Key key, this.model})
      : super(key: key);

  @override
  _ListaIdentificacaoCivilUnicaConsultasViewState createState() =>
      _ListaIdentificacaoCivilUnicaConsultasViewState();
}

class _ListaIdentificacaoCivilUnicaConsultasViewState
    extends State<ListaIdentificacaoCivilUnicaConsultasView> {
  ScrollController _scrollController;
  var consultaUnicaController = ConsultaUnicaController();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    //_scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset == //_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (widget.model.paginacao == null ||
          !widget.model.paginacao.seChegouAoFinalDaPagina()) {
        setState(() {});
        consultaUnicaController
            .buscarIdentificacoesCivis(context, widget.model)
            .then((value) {
          setState(() {});
        });
      }
    }
  }

  Widget _listViewScreen() {
    return Scaffold(
      appBar: AppBarDefault.getAppComTitulo(
          titulo: "Resultado Identificação Civil"),
      body: Center(
        child: ListView.builder(
          controller: _scrollController,
          itemCount:
              widget.model.itensIdentificacaoCriminalModels.cidadaos.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return _buildRow(
                widget.model.itensIdentificacaoCriminalModels.cidadaos[index]);
          },
        ),
      ),
    );
  }

  Widget _buildRow(Cidadao item) {
    return InkWell(
      onTap: () {
        setState(() {});
        consultaUnicaController
            .buscarIdentificacaoCivilPorId(context, item)
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
                    "RG: ${item.rg}",
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

  //Controle do scroll: ao final do scroll é carregado novos elementos

  Widget _homeViewScreen() {
    return Scaffold(
      appBar: AppBarDefault.getAppComTitulo(
          titulo: "Carregando. Aguarde..."), //carrregando por resultado
    );
  }

  @override
  Widget build(BuildContext context) {
    FutureBuilder _futureScreen() {
      return FutureBuilder(
          future: consultaUnicaController.buscarIdentificacoesCivis(
              context, widget.model),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return ValidatorsUtils.listNotNullAndNotEmpty(
                        widget.model.itensIdentificacaoCriminalModels.cidadaos)
                    ? _listViewScreen()
                    : _homeViewScreen();
                break;
              default:
                return _homeViewScreen();
            }
          });
    }

    return ValidatorsUtils.listNotNullAndNotEmpty(
            widget.model.itensIdentificacaoCriminalModels.cidadaos)
        ? _listViewScreen()
        : _futureScreen();
  }
}
