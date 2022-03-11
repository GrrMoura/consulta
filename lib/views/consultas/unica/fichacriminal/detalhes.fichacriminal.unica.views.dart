import 'package:consulta_integrada/models/fichacriminal.models.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/styles/widgets/appbar.widgets.dart';
import 'package:consulta_integrada/styles/widgets/clipboard.widgets.dart';
import 'package:consulta_integrada/styles/widgets/container.widgets.dart';
import 'package:consulta_integrada/styles/widgets/divider.widgets.dart';
import 'package:consulta_integrada/views/consultas/unica/fichacriminal/processo.fichacriminal.unica.consultas.views.dart';
import 'package:flutter/material.dart';

class DetalhesFichaCriminalUnicaConsultasView extends StatefulWidget {
  final FichaCriminalModels model;

  DetalhesFichaCriminalUnicaConsultasView({Key key, this.model})
      : super(key: key);

  @override
  _DetalhesFichaCriminalUnicaConsultasViewState createState() =>
      new _DetalhesFichaCriminalUnicaConsultasViewState();
}

class _DetalhesFichaCriminalUnicaConsultasViewState
    extends State<DetalhesFichaCriminalUnicaConsultasView> {
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
      value != null ? value.trim() : "Não informado",
      style: FontDefaultStyles.smBold(),
    );
  }

  Widget titulo(String value) {
    return Text(
      value,
      style: _textStyleTitle,
    );
  }

  Widget dadosPessoais() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ContainerWidgets.getContainerTitle("Dados Pessoais"),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  titulo("Nome"),
                  informacaoComClipboard(widget.model.nome.trim()),
                  _divider,
                  titulo("Alcunha (Vulgo)"),
                  informacaoSemClipboard(widget.model.apelido),
                  _divider,
                  titulo("Data nascimento"),
                  informacaoSemClipboard(widget.model.dataNascimento),
                  _divider,
                  titulo("Nome da mãe"),
                  informacaoSemClipboard(widget.model.nomeMae),
                  _divider,
                  titulo("Nome do pai"),
                  informacaoSemClipboard(widget.model.nomePai),
                  _divider,
                  titulo("RG"),
                  informacaoComClipboard(widget.model.rg),
                  _divider,
                  titulo("Naturalidade"),
                  informacaoSemClipboard(widget.model.naturalidade),
                  _divider,
                  titulo("Sexo"),
                  informacaoSemClipboard(widget.model.getSexo()),
                  _divider,
                  titulo("Cor"),
                  informacaoSemClipboard(widget.model.cor),
                  _divider,
                  titulo("Estado Civil"),
                  informacaoSemClipboard(widget.model.estadoCivil),
                  _divider,
                  titulo("Escolaridade"),
                  informacaoSemClipboard(widget.model.escolaridade),
                  _divider,
                  titulo("Profissão"),
                  informacaoSemClipboard(widget.model.profissao),
                  _divider,
                  titulo("Data de inclusão"),
                  informacaoSemClipboard(widget.model.dataInclusao),
                ]),
          ),
        ]);
  }

  Widget endereco() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ContainerWidgets.getContainerTitle("Endereço"),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  titulo("Rua"),
                  informacaoSemClipboard(widget.model.rua),
                  _divider,
                  titulo("Complemento"),
                  informacaoSemClipboard(widget.model.complemento),
                  _divider,
                  titulo("Bairro"),
                  informacaoSemClipboard(widget.model.bairro),
                  _divider,
                  titulo("Cidade"),
                  informacaoSemClipboard(widget.model.cidadeEndereco),
                  _divider,
                  titulo("Estado"),
                  informacaoSemClipboard(widget.model.ufEndereco),
                ]),
          ),
        ]);
  }

  Widget _listViewProcessos() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.model.processosCriminais.length,
      itemBuilder: (BuildContext ctxt, int index) {
        return _buildRow(widget.model.processosCriminais[index]);
      },
    );
  }

  Widget _buildRow(ProcessosCriminais item) {
    return InkWell(
      radius: 20,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                ProcessoFichaCriminalUnicaConsultasView(model: item)));
      },
      child: Column(children: <Widget>[
        Container(
          padding: const EdgeInsets.all(11),
          child: Row(children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(item.numeroProcesso, style: FontDefaultStyles.smBold()),
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

  Widget processosNaoEncontrados() {
    return Padding(
        padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              informacaoSemClipboard("Nenhum processo encontrado")
            ]));
  }

  Widget processos() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ContainerWidgets.getContainerTitle("Processos"),
          widget.model.processosCriminais != null &&
                  widget.model.processosCriminais.isNotEmpty
              ? _listViewProcessos()
              : processosNaoEncontrados(),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault.getAppComTitulo(titulo: "Dados"),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: new Column(
          children: <Widget>[dadosPessoais(), endereco(), processos()],
        ),
      ),
    );
  }
}
