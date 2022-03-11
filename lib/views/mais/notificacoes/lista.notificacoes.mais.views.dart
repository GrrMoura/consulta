import 'package:consulta_integrada/controllers/mais.controllers.dart';
import 'package:consulta_integrada/models/itensnotificacao.models.dart';
import 'package:consulta_integrada/models/notificacao.models.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/styles/widgets/appbar.widgets.dart';
import 'package:consulta_integrada/styles/widgets/divider.widgets.dart';
import 'package:consulta_integrada/utils/validators.utils.dart';
import 'package:flutter/material.dart';

class ListaNotificacoesMaisView extends StatefulWidget {
  final ItensNotificacaoModels model;
  ListaNotificacoesMaisView({Key key, this.model}) : super(key: key);

  @override
  _ListaNotificacoesMaisViewState createState() =>
      new _ListaNotificacoesMaisViewState();
}

class _ListaNotificacoesMaisViewState extends State<ListaNotificacoesMaisView> {
  ScrollController _scrollController;
  var maisController = new MaisController();

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
        maisController.buscarNotificacoes(context, widget.model).then((value) {
          setState(() {});
        });
      }
    }
  }

  Widget _buildRow(NotificacaoModels item) {
    return InkWell(
      onTap: () {
        setState(() {});
        maisController.buscarNotificacaoPorId(context, item).then((value) {
          setState(() {});
        });
      },
      child: Column(children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10.0),
          child: Row(children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                  backgroundColor: DefaultTheme.getColor(),
                  child: IconButton(
                    onPressed: null,
                    iconSize: 25.0,
                    icon: item.visualizada
                        ? Image.asset(
                            "assets/icons/email_lido.png",
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.email_rounded,
                            color: Colors.white,
                          ),
                  )),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.titulo,
                    style: item.visualizada
                        ? FontDefaultStyles.sm()
                        : FontDefaultStyles.smBold(),
                  ),
                  Text(
                    item.texto,
                    style: FontDefaultStyles.sm_1(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            item.data,
                            style: item.visualizada
                                ? FontDefaultStyles.sm_0()
                                : FontDefaultStyles.sm_0()
                                    .copyWith(color: Colors.blue[900]),
                            textAlign: TextAlign.right,
                          ),
                        ]),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(0.0),
              height: 28.0,
              child: IconButton(
                onPressed: null,
                iconSize: 16.0,
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: DefaultTheme.getColor(),
                ),
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
      appBar: AppBarDefault.getAppComTitulo(titulo: "Notificações"),
      body: Center(
        child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.model.notificacoes.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return _buildRow(widget.model.notificacoes[index]);
          },
        ),
      ),
    );
  }

  Widget _homeViewScreen() {
    return Scaffold(
      appBar: AppBarDefault.getAppComTitulo(titulo: "Resultado"),
    );
  }

  @override
  Widget build(BuildContext context) {
    FutureBuilder _futureScreen() {
      return FutureBuilder(
          future: maisController.buscarNotificacoes(context, widget.model),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return ValidatorsUtils.listNotNullAndNotEmpty(
                        widget.model.notificacoes)
                    ? _listViewScreen()
                    : _homeViewScreen();
                break;
              default:
                return _homeViewScreen();
            }
          });
    }

    return ValidatorsUtils.listNotNullAndNotEmpty(widget.model.notificacoes)
        ? _listViewScreen()
        : _futureScreen();
  }
}
