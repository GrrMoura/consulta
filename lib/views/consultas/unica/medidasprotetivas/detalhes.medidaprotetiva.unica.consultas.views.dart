import 'package:consulta_integrada/models/medidaprotetiva.models.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/styles/widgets/appbar.widgets.dart';
import 'package:consulta_integrada/styles/widgets/clipboard.widgets.dart';
import 'package:consulta_integrada/styles/widgets/container.widgets.dart';
import 'package:flutter/material.dart';

class DetalhesMedidaProtetivaUnicaConsultasView extends StatefulWidget {
  final MedidaProtetivaModels model;

  DetalhesMedidaProtetivaUnicaConsultasView({Key key, this.model})
      : super(key: key);

  @override
  _DetalhesMedidaProtetivaUnicaConsultasViewState createState() =>
      new _DetalhesMedidaProtetivaUnicaConsultasViewState();
}

class _DetalhesMedidaProtetivaUnicaConsultasViewState
    extends State<DetalhesMedidaProtetivaUnicaConsultasView> {
  final _divider = Divider(
    color: DefaultTheme.getColor(),
    height: 20.0,
  );

  final _textStyleTitle =
  FontDefaultStyles.sm_1().apply(color: Colors.blue[900]);

  Widget informacaoComClipboard(String value) {
    return Row(children: <Widget>[
      Expanded(
        flex: 200,
        child: Text(
          value != null ? value : "Não informado",
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

  Widget informacaoSemClipboard(String value) {
    return Text(
      value.trim(),
      style: FontDefaultStyles.smBold(),
    );
  }

  Widget titulo(String value) {
    return Text(
      value,
      style: _textStyleTitle,
    );
  }

  Widget dadosDoProcesso() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ContainerWidgets.getContainerTitle("Processo"),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  titulo("Processo"),
                  informacaoComClipboard(widget.model.processo.trim()),
                  _divider,
                  titulo("Status"),
                  informacaoSemClipboard(widget.model.status.trim()),
                  _divider,
                  titulo("Resumo"),
                  informacaoSemClipboard(widget.model.resumo.trim()),
                  _divider,
                  titulo("Data oficialização"),
                  informacaoSemClipboard(widget.model.dataOficializacao.trim()),
                  _divider,
                  titulo("Data revogação"),
                  informacaoSemClipboard(widget.model.dataRevogacao.trim()),
                ]),
          ),
        ]);
  }

    Widget dadosDaVitima() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
        Widget>[
      ContainerWidgets.getContainerTitle("Dados da Vítima"),
      Padding(
        padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          titulo("Nome"),
          informacaoComClipboard(widget.model.vitima.trim()),
          _divider,
          titulo("Endereço"),
          informacaoSemClipboard(
              widget.model.enderecoVitima.trim()),
          _divider,
          titulo("Telefone celular"),
          informacaoSemClipboard(
              widget.model.telefoneCelularVitima.trim()),
          _divider,
          titulo("Telefone residencial"),
          informacaoSemClipboard(widget.model.telefoneResidencialVitima.trim()),
          _divider,
          titulo("Telefone profissional"),
          informacaoSemClipboard(widget.model.telefoneProfissionalVitima.trim()),
          _divider,
          titulo("Contato em caso de urgência"),
          informacaoSemClipboard(widget.model.contatoUrgenciaVitima.trim()),
          _divider,
          titulo("Telefone em caso de urgência"),
          informacaoSemClipboard(widget.model.telefoneContatoUrgenciaVitima.trim()),
        ]),
      ),
    ]);
  }

  Widget dadosDoReu() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
        Widget>[
      ContainerWidgets.getContainerTitle("Dados do réu"),
      Padding(
        padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          titulo("Nome"),
          informacaoComClipboard(widget.model.reu.trim()),
          _divider,
          titulo("Endereço"),
          informacaoSemClipboard(
              widget.model.enderecoReu.trim()),
          _divider,
          titulo("Telefone celular"),
          informacaoSemClipboard(widget.model.telefoneCelularReu.trim()),
          _divider,
          titulo("Telefone residencial"),
          informacaoSemClipboard(widget.model.telefoneResidencialReu.trim()),
          _divider,
          titulo("Telefone profissional"),
          informacaoSemClipboard(widget.model.telefoneProfissionalReu.trim()),
        ]),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault.getAppComTitulo(titulo: "Dados"),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: new Column(
          children: <Widget>[dadosDoProcesso(), dadosDaVitima(), dadosDoReu()],
        ),
      ),
    );
  }
}
