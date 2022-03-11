import 'package:consulta_integrada/models/imei.models.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/styles/widgets/appbar.widgets.dart';
import 'package:consulta_integrada/styles/widgets/clipboard.widgets.dart';
import 'package:consulta_integrada/styles/widgets/container.widgets.dart';
import 'package:flutter/material.dart';

class DetalhesConsultaSimplesImeiConsultasView extends StatefulWidget {
  DetalhesConsultaSimplesImeiConsultasView({Key key, this.model})
      : super(key: key);

  final ImeiModels model;

  @override
  _DetalhesConsultaSimplesImeiConsultasViewState createState() =>
      new _DetalhesConsultaSimplesImeiConsultasViewState();
}

class _DetalhesConsultaSimplesImeiConsultasViewState
    extends State<DetalhesConsultaSimplesImeiConsultasView> {
  final _divider = Divider(
    color: DefaultTheme.getColor(),
    height: 20.0,
  );

  final _textStyleTitle =
      FontDefaultStyles.sm_1().apply(color: Colors.blue[900]);

  String getText(String value) {
    return value != null ? value.trim() : "Não informado";
  }

  Widget informacaoComClipboard(String value) {
    return Row(children: <Widget>[
      Expanded(
        flex: 300,
        child: Text(
          value,
          style: FontDefaultStyles.smBold(),
        ),
      ),
      Spacer(
        flex: 5,
      ),
      Container(
        padding: const EdgeInsets.all(0.0),
        height: 28.0,
        child: IconButton(
            iconSize: 16.0,
            icon: Icon(
              Icons.copy,
              color: DefaultTheme.getColor(),
            ),
            onPressed: () {
              ClipBoardWidget.setValue(context, value);
            }),
      ),
    ]);
  }

  Widget info(String title, String value,
      {bool usarDivider: true,
      bool usarClipBoard: false,
      bool usaFonteRed: false}) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: _textStyleTitle,
          ),
          if (usarClipBoard)
            informacaoComClipboard(value)
          else
            Text(
              getText(value),
              style: !usaFonteRed
                  ? FontDefaultStyles.smBold()
                  : FontDefaultStyles.smBold().copyWith(color: Colors.red),
            ),
          if (usarDivider) _divider,
        ]);
  }

  bool exibirDadosNaoEncontrados() {
    return (widget.model.alerta == null && widget.model.delegacia == null) ||
        (widget.model.alerta != null &&
            !widget.model.alerta.ocorrencia &&
            widget.model.delegacia == null);
  }

  bool sePossuirAlertaEPossuirOcorrencia() {
    return widget.model.alerta != null && widget.model.alerta.ocorrencia;
  }

  bool sePossuirAlertaENaoPossuirOcorrencia() {
    return widget.model.alerta != null && !widget.model.alerta.ocorrencia;
  }

  bool seAlertaPossuirNome() {
    return widget.model.alerta.nome != null &&
        widget.model.alerta.nome.isNotEmpty &&
        widget.model.alerta.nome.compareTo("-") != 0;
  }

  bool exibeImeiConsultado() {
    return sePossuirAlertaEPossuirOcorrencia();
  }

  @override
  Widget build(BuildContext context) {
    Widget restricao() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Restrição",
            style: _textStyleTitle,
          ),
          Text(
            "Em alerta",
            style: FontDefaultStyles.smBold().apply(color: Colors.red),
          ),
        ],
      );
    }

    Widget imeiConsultado() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ContainerWidgets.getContainerDetalhesTitle("Imei Consultado"),
            Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        getText(widget.model.alerta.imei),
                        style: FontDefaultStyles.smBold(),
                      )
                    ]))
          ]);
    }

    // depende de alerta e delegacia
    Widget dadosDoDispositivo() {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        ContainerWidgets.getContainerDetalhesTitle("Dados do Dispositivo"),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (widget.model.alerta.ocorrencia == true &&
                    seAlertaPossuirNome())
                  info("Proprietário", widget.model.alerta.nome,
                      usarClipBoard: true)
                else if (!seAlertaPossuirNome())
                  info("Usuário Intranet", widget.model.alerta.usuarioIntranet),
                if (seAlertaPossuirNome() &&
                    widget.model.delegacia != null &&
                    !widget.model.alerta.ocorrencia)
                  info("Proprietário", widget.model.delegacia.nome,
                      usarClipBoard: true)
                else if (!seAlertaPossuirNome())
                  info("Unidade Cadastro",
                      widget.model.alerta.unidadeAdministrativa),
                if (widget.model.alerta.ocorrencia)
                  info("Marca", widget.model.alerta.marca),
                if (widget.model.alerta.ocorrencia)
                  info("Modelo", widget.model.alerta.modelo),
                if (!widget.model.alerta.ocorrencia &&
                    widget.model.delegacia != null)
                  info("Marca", widget.model.delegacia.marca),
                if (!widget.model.alerta.ocorrencia &&
                    widget.model.delegacia != null)
                  info("Modelo", widget.model.delegacia.modelo),
                if (widget.model.delegacia != null)
                  info("Ocorrência", widget.model.delegacia.ocorrencia.tipo,
                      usaFonteRed: true),
                if (widget.model.alerta.ocorrencia) restricao(),
              ]),
        ),
      ]);
    }

    Widget _widgetDadosNaoEncontrados() {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: DefaultTheme.getColor(),
          title: Text(
            "Consulta Integrada",
            style: FontDefaultStyles.sm(),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Nenhuma informação encontrada",
                style: FontDefaultStyles.sm(),
              ),
            ],
          ),
        ),
      );
    }

    Widget _widgetDetalhesImei() {
      return Scaffold(
        appBar: AppBarDefault.getAppComTitulo(),
        body: DefaultTextStyle(
          style: TextStyle(color: Colors.black),
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if (exibeImeiConsultado()) imeiConsultado(),
                      dadosDoDispositivo(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    }

    return exibirDadosNaoEncontrados()
        ? _widgetDadosNaoEncontrados()
        : _widgetDetalhesImei();
  }
}
