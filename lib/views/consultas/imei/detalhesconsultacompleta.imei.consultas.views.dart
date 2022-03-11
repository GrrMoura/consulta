import 'package:consulta_integrada/models/imei.models.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/styles/widgets/appbar.widgets.dart';
import 'package:consulta_integrada/styles/widgets/clipboard.widgets.dart';
import 'package:consulta_integrada/styles/widgets/container.widgets.dart';
import 'package:consulta_integrada/utils/objecttostring.utils.dart';
import 'package:flutter/material.dart';

class DetalhesConsultaCompletaImeiConsultasView extends StatefulWidget {
  DetalhesConsultaCompletaImeiConsultasView({Key key, this.model})
      : super(key: key);

  final ImeiModels model;

  @override
  _DetalhesImeiConsultasViewState createState() =>
      new _DetalhesImeiConsultasViewState();
}

class _DetalhesImeiConsultasViewState
    extends State<DetalhesConsultaCompletaImeiConsultasView> {
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
        flex: 200,
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

  Widget infoComDivider(String title, String value) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: _textStyleTitle,
          ),
          informacaoComClipboard(getText(value)),
          _divider,
        ]);
  }

  bool exibirDadosNaoEncontrados() {
    return (widget.model.alerta == null && widget.model.delegacia == null);
    //|| (widget.model.alerta != null && !widget.model.alerta.ocorrencia);
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

  bool exibeDadosDoAlertaCelular() {
    return sePossuirAlertaEPossuirOcorrencia();
  }

  bool exibeSituacao() {
    return sePossuirAlertaEPossuirOcorrencia();
  }

  bool exibeDadosDaDelegaciaVirtual() {
    return widget.model.delegacia != null;
  }

  bool exibeImeiConsultado() {
    return sePossuirAlertaEPossuirOcorrencia();
  }

  bool exibeDadosDoProprietarioAlerta() {
    return sePossuirAlertaEPossuirOcorrencia() &&
        widget.model.alerta.nome.isNotEmpty;
  }

  bool exibeDadosDoProprietarioDelegacia() {
    return widget.model.delegacia != null &&
        sePossuirAlertaENaoPossuirOcorrencia();
  }

  bool exibeOcorrencia() {
    return widget.model.delegacia != null;
  }

  @override
  Widget build(BuildContext context) {
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
    Widget dadosDoProprietarioAlerta() {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        ContainerWidgets.getContainerDetalhesTitle("Dados do proprietário"),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Nome",
                style: _textStyleTitle,
              ),
              informacaoComClipboard(widget.model.alerta.nome),
              _divider,
              Text(
                "CPF",
                style: _textStyleTitle,
              ),
              informacaoComClipboard(widget.model.alerta.cpf),
              _divider,
              Text(
                "RG",
                style: _textStyleTitle,
              ),
              informacaoComClipboard(widget.model.alerta.rg),
              _divider,
              Text(
                "Data de nascismento",
                style: _textStyleTitle,
              ),
              Text(
                getText(widget.model.alerta.dataNascimento),
                style: FontDefaultStyles.smBold(),
              ),
              _divider,
              Text(
                "Contatos",
                style: _textStyleTitle,
              ),
              Text(
                ObjectToStringUtils.todosContatos(widget.model.alerta.contatos),
                style: FontDefaultStyles.smBold(),
              ),
            ],
          ),
        ),
      ]);
    }

    Widget dadosDoProprietarioDelegacia() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ContainerWidgets.getContainerDetalhesTitle("Dados do proprietário"),
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Nome",
                    style: _textStyleTitle,
                  ),
                  informacaoComClipboard(widget.model.delegacia.nome),
                  _divider,
                  Text(
                    "CPF",
                    style: _textStyleTitle,
                  ),
                  informacaoComClipboard(widget.model.delegacia.cpf),
                  _divider,
                  Text(
                    "RG",
                    style: _textStyleTitle,
                  ),
                  informacaoComClipboard(widget.model.delegacia.rg),
                  _divider,
                  Text(
                    "Data de nascismento",
                    style: _textStyleTitle,
                  ),
                  Text(
                    getText(widget.model.delegacia.dataNascimento),
                    style: FontDefaultStyles.smBold(),
                  ),
                  _divider,
                  Text(
                    "Contatos",
                    style: _textStyleTitle,
                  ),
                  Text(
                    ObjectToStringUtils.todosContatos(
                        widget.model.delegacia.contatos),
                    style: FontDefaultStyles.smBold(),
                  ),
                ],
              ),
            ),
          ]);
    }

    // dados do alerta celular
    Widget dadosDoAlertaCelular() {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        ContainerWidgets.getContainerDetalhesTitle("Dados do alerta celular"),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "IMEIs",
                style: _textStyleTitle,
              ),
              Text(
                ObjectToStringUtils.todosImeis(widget.model.alerta.imeis),
                style: FontDefaultStyles.smBold(),
              ),
              _divider,
              Text(
                "Número de telefone",
                style: _textStyleTitle,
              ),
              Text(
                getText(widget.model.alerta.numeroTelefone),
                style: FontDefaultStyles.smBold(),
              ),
              _divider,
              Text(
                "Operadora",
                style: _textStyleTitle,
              ),
              Text(
                getText(widget.model.alerta.operadora),
                style: FontDefaultStyles.smBold(),
              ),
              _divider,
              Text(
                "Marca",
                style: _textStyleTitle,
              ),
              Text(
                getText(widget.model.alerta.marca),
                style: FontDefaultStyles.smBold(),
              ),
              _divider,
              Text(
                "Modelo",
                style: _textStyleTitle,
              ),
              Text(
                getText(widget.model.alerta.modelo),
                style: FontDefaultStyles.smBold(),
              ),
              _divider,
              Text(
                "Número de série",
                style: _textStyleTitle,
              ),
              Text(
                getText(widget.model.alerta.numeroSerie),
                style: FontDefaultStyles.smBold(),
              ),
            ],
          ),
        ),
      ]);
    }

    // dados do alerta celular
    Widget situacao() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ContainerWidgets.getContainerDetalhesTitle("Situação"),
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
              child: Column(
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
                  _divider,
                  Text(
                    "Número do boletim de ocorrência",
                    style: _textStyleTitle,
                  ),
                  Text(
                    getText(widget.model.alerta.bo),
                    style: FontDefaultStyles.smBold(),
                  ),
                ],
              ),
            ),
          ]);
    }

    Widget dadosDaDelegaciaVirtual() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ContainerWidgets.getContainerDetalhesTitle(
                "Dados da delegacia virtual"),
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "IMEI",
                    style: _textStyleTitle,
                  ),
                  Text(
                    getText(widget.model.delegacia.imei),
                    style: FontDefaultStyles.smBold(),
                  ),
                  _divider,
                  Text(
                    "Número de telefone",
                    style: _textStyleTitle,
                  ),
                  Text(
                    getText(widget.model.delegacia.numeroTelefone),
                    style: FontDefaultStyles.smBold(),
                  ),
                  _divider,
                  Text(
                    "Operadora",
                    style: _textStyleTitle,
                  ),
                  Text(
                    getText(widget.model.delegacia.operadora),
                    style: FontDefaultStyles.smBold(),
                  ),
                  _divider,
                  Text(
                    "Marca",
                    style: _textStyleTitle,
                  ),
                  Text(
                    getText(widget.model.delegacia.marca),
                    style: FontDefaultStyles.smBold(),
                  ),
                  _divider,
                  Text(
                    "Modelo",
                    style: _textStyleTitle,
                  ),
                  Text(
                    getText(widget.model.delegacia.modelo),
                    style: FontDefaultStyles.smBold(),
                  ),
                  _divider,
                  Text(
                    "Número de série",
                    style: _textStyleTitle,
                  ),
                  Text(
                    getText(widget.model.delegacia.numeroSerie),
                    style: FontDefaultStyles.smBold(),
                  ),
                ],
              ),
            ),
          ]);
    }

    Widget ocorrencia() {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        ContainerWidgets.getContainerDetalhesTitle("Ocorrência"),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Tipo",
                style: _textStyleTitle,
              ),
              Text(
                getText(widget.model.delegacia.ocorrencia.tipo),
                style: FontDefaultStyles.smBold().copyWith(color: Colors.red),
              ),
              _divider,
              Text(
                "Descrição",
                style: _textStyleTitle,
              ),
              Text(
                getText(widget.model.delegacia.ocorrencia.descricao),
                style: FontDefaultStyles.smBold(),
              ),
              _divider,
              Text(
                "Histórico",
                style: _textStyleTitle,
              ),
              Text(
                getText(widget.model.delegacia.ocorrencia.historico),
                style: FontDefaultStyles.smBold(),
              ),
              _divider,
              Text(
                "Endereço de fato",
                style: _textStyleTitle,
              ),
              Text(
                getText(widget.model.delegacia.ocorrencia.enderecoFato),
                style: FontDefaultStyles.smBold(),
              ),
              _divider,
              Text(
                "Número",
                style: _textStyleTitle,
              ),
              Text(
                getText(widget.model.delegacia.ocorrencia.numeroEnderecoFato),
                style: FontDefaultStyles.smBold(),
              ),
              _divider,
              Text(
                "Complemento",
                style: _textStyleTitle,
              ),
              Text(
                getText(
                    widget.model.delegacia.ocorrencia.complementoEnderecoFato),
                style: FontDefaultStyles.smBold(),
              ),
              _divider,
              Text(
                "Bairro",
                style: _textStyleTitle,
              ),
              Text(
                getText(widget.model.delegacia.ocorrencia.bairro),
                style: FontDefaultStyles.smBold(),
              ),
              _divider,
              Text(
                "Data do fato",
                style: _textStyleTitle,
              ),
              Text(
                getText(widget.model.delegacia.ocorrencia.dataHoraFato),
                style: FontDefaultStyles.smBold(),
              ),
            ],
          ),
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
                      if (exibeDadosDoProprietarioAlerta())
                        dadosDoProprietarioAlerta(),
                      if (exibeDadosDoProprietarioDelegacia())
                        dadosDoProprietarioDelegacia(),
                      if (exibeDadosDoAlertaCelular()) dadosDoAlertaCelular(),
                      if (exibeSituacao()) situacao(),
                      if (exibeDadosDaDelegaciaVirtual())
                        dadosDaDelegaciaVirtual(),
                      if (exibeOcorrencia()) ocorrencia(),
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
