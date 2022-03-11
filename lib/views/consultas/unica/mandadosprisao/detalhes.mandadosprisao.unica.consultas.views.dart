import 'dart:convert';
import 'package:consulta_integrada/models/mandadoprisaodetalhado.models.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/styles/widgets/appbar.widgets.dart';
import 'package:consulta_integrada/styles/widgets/clipboard.widgets.dart';
import 'package:consulta_integrada/styles/widgets/container.widgets.dart';
import 'package:consulta_integrada/styles/widgets/divider.widgets.dart';
import 'package:consulta_integrada/utils/validators.utils.dart';
import 'package:consulta_integrada/views/consultas/unica/mandadosprisao/exibicao_foto_mandado_prisao.dart';
import 'package:consulta_integrada/views/consultas/unica/medidasprotetivas/processo.mandadosprisao.unica.consultas.views.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class DetalhesMandadosDePrisaolUnicaConsultasView extends StatefulWidget {
  final MandadoPrisaoDetalhadoModels model;

  DetalhesMandadosDePrisaolUnicaConsultasView({Key key, this.model})
      : super(key: key);
  @override
  _DetalhesMandadosDePrisaolUnicaConsultasViewState createState() =>
      _DetalhesMandadosDePrisaolUnicaConsultasViewState();
}

class _DetalhesMandadosDePrisaolUnicaConsultasViewState
    extends State<DetalhesMandadosDePrisaolUnicaConsultasView> {
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

  String getStringPorBool(bool value) {
    return value ? "Sim" : "Não";
  }

  Widget titulo(String value) {
    return Text(
      value,
      style: _textStyleTitle,
    );
  }

  Widget fotos(String base64) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Center(child: avatarFoto(base64))]),
          )
        ]);
  }

  Widget avatarFoto(String foto) {
    return foto != null
        ? Padding(
            padding: EdgeInsets.all(20),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.scale,
                      alignment: Alignment.center,
                      duration: const Duration(milliseconds: 500),
                      reverseDuration: const Duration(milliseconds: 500),
                      child: ExibicaoFotoMandadoDePrisao(foto),
                    ));
              },
              child: Container(
                height: 150,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: MemoryImage(base64Decode(foto)),
                        fit: BoxFit.fitHeight),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              ),
            ),
          )
        : Image.asset(
            "assets/icons/sem-fotos.png",
            width: 150.0,
            height: 150.0,
          );
  }

  Widget dadosPessoais() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
        Widget>[
      ContainerWidgets.getContainerTitle("Dados Pessoais"),
      Padding(
        padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          widget.model.detalhes.checkFotos
              ? fotos(widget.model.detalhes.foto[0].foto)
              : Padding(padding: EdgeInsets.zero),
          titulo("Nome"),
          informacaoSemClipboard(widget.model.detalhes.nome),
          _divider,
          titulo("Alcunha (Vulgo)"),
          informacaoSemClipboard(widget.model.detalhes.alcunha),
          _divider,
          titulo("Data nascimento"),
          informacaoSemClipboard(widget.model.detalhes.dataNascimento),
          _divider,
          titulo("Nome da mãe"),
          informacaoSemClipboard(widget.model.detalhes.mae),
          _divider,
          titulo("Nome do pai"),
          informacaoSemClipboard(widget.model.detalhes.pai),
          _divider,
          titulo("E-mail"),
          informacaoSemClipboard(widget.model.detalhes.email),
          _divider,
          titulo("Estado Civil"),
          informacaoSemClipboard(widget.model.detalhes.estadoCivil),
          _divider,
          titulo("Sexo"),
          informacaoSemClipboard(widget.model.detalhes.sexo),
          _divider,
          titulo("Orientação sexual"),
          informacaoSemClipboard(widget.model.detalhes.orientacaoSexual),
          _divider,
          titulo("Profissão"),
          informacaoSemClipboard(widget.model.detalhes.profissao),
          _divider,
          titulo("Tipo Emprego"),
          informacaoSemClipboard(widget.model.detalhes.tipoEmprego),
          _divider,
          titulo("Dependente Químico"),
          informacaoSemClipboard(getStringPorBool(
              widget.model.detalhes.flagDependenteQuimico ?? false)),
          _divider,
          titulo("Irmão Gêmeo"),
          informacaoSemClipboard(
              getStringPorBool(widget.model.detalhes.flgIrmaoGemeo ?? false)),
          _divider,
          titulo("Escolaridade"),
          informacaoSemClipboard(widget.model.detalhes.escolaridade),
          _divider,
          titulo("Cor/Raça"),
          informacaoSemClipboard(widget.model.detalhes.corRaca),
          _divider,
          titulo("Cor/Raça"),
          informacaoSemClipboard(widget.model.detalhes.corRaca),
          _divider,
          titulo("Gravidez"),
          informacaoSemClipboard(
              getStringPorBool(widget.model.detalhes.flagGravidez ?? false)),
          _divider,
          titulo("Lactante"),
          informacaoSemClipboard(
              getStringPorBool(widget.model.detalhes.flagLactante ?? false)),
          _divider,
          titulo("Deficiente"),
          informacaoSemClipboard(getStringPorBool(
              widget.model.detalhes.flgDeficienteFisico ?? false)),
          _divider,
          titulo("Deficiente"),
          informacaoSemClipboard(getStringPorBool(
              widget.model.detalhes.flgDeficienteFisico ?? false)),
          _divider,
          titulo("País"),
          informacaoSemClipboard(widget.model.detalhes.pais),
          _divider,
          titulo("Cidade"),
          informacaoSemClipboard(widget.model.detalhes.municipio),
          _divider,
          titulo("UF"),
          informacaoSemClipboard(widget.model.detalhes.uf),
        ]),
      ),
    ]);
  }

  bool exibirCustodia() => widget.model.detalhes.pessoa != null;

  Widget custodia() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
        Widget>[
      ContainerWidgets.getContainerTitle("Custódia"),
      Padding(
        padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          titulo("Ativo"),
          informacaoSemClipboard(
              getStringPorBool(widget.model.detalhes.pessoa.flgAtivo)),
          _divider,
          titulo("Número do Indivíduo"),
          informacaoSemClipboard(widget.model.detalhes.pessoa.numeroIndividuo),
          _divider,
          titulo("Status"),
          informacaoSemClipboard(widget.model.detalhes.pessoa.statusPessoa),
          _divider,
          titulo("Município da Custódia"),
          informacaoSemClipboard(
              widget.model.detalhes.pessoa.municipioCustodia),
          _divider,
          titulo("Justificativa"),
          informacaoSemClipboard(widget.model.detalhes.pessoa.justificativa),
          _divider,
          titulo("Data de Vencimento"),
          informacaoSemClipboard(
              widget.model.detalhes.pessoa.dataVencimentosMandados),
          _divider,
          titulo("Data de Experiência"),
          informacaoSemClipboard(
              widget.model.detalhes.pessoa.dataExpiracaoMandadoPrisao),
          _divider,
          titulo("Data de Cadastro"),
          informacaoSemClipboard(widget.model.detalhes.pessoa.dataCadastro),
          _divider,
          titulo("Data da Última Edição"),
          informacaoSemClipboard(widget.model.detalhes.pessoa.dataUltimaEdicao),
        ]),
      ),
    ]);
  }

  bool exibirSinaisEMarcas() => widget.model.detalhes.sinaisMarcas != null;

  Widget sinaisEMarcas() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
        Widget>[
      ContainerWidgets.getContainerTitle("Sinais e Marcas"),
      Padding(
        padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          titulo("Altura"),
          informacaoSemClipboard(widget.model.detalhes.sinaisMarcas.altura),
          _divider,
          titulo("Barba"),
          informacaoSemClipboard(widget.model.detalhes.sinaisMarcas.barba),
          _divider,
          titulo("Bigode"),
          informacaoSemClipboard(widget.model.detalhes.sinaisMarcas.bigode),
          _divider,
          titulo("Boca"),
          informacaoSemClipboard(widget.model.detalhes.sinaisMarcas.boca),
          _divider,
          titulo("Biotipo"),
          informacaoSemClipboard(widget.model.detalhes.sinaisMarcas.biotipo),
          _divider,
          titulo("Tipo de Cabelo"),
          informacaoSemClipboard(widget.model.detalhes.sinaisMarcas.tipoCabelo),
          _divider,
          titulo("Cor de Olhos"),
          informacaoSemClipboard(widget.model.detalhes.sinaisMarcas.corOlhos),
          _divider,
          titulo("Formato dos Olhos"),
          informacaoSemClipboard(
              widget.model.detalhes.sinaisMarcas.formatoOlhos),
          _divider,
          titulo("Cor da Pele"),
          informacaoSemClipboard(widget.model.detalhes.sinaisMarcas.corPele),
          _divider,
          titulo("Lábios"),
          informacaoSemClipboard(widget.model.detalhes.sinaisMarcas.labios),
          _divider,
          titulo("Nariz"),
          informacaoSemClipboard(widget.model.detalhes.sinaisMarcas.nariz),
          _divider,
          titulo("Orelhas"),
          informacaoSemClipboard(widget.model.detalhes.sinaisMarcas.orelhas),
          _divider,
          titulo("Pescoço"),
          informacaoSemClipboard(widget.model.detalhes.sinaisMarcas.pescoco),
          _divider,
          titulo("Rosto"),
          informacaoSemClipboard(widget.model.detalhes.sinaisMarcas.rosto),
          _divider,
          titulo("Sobrancelhas"),
          informacaoSemClipboard(
              widget.model.detalhes.sinaisMarcas.sobrancelhas),
          _divider,
          titulo("Testa"),
          informacaoSemClipboard(widget.model.detalhes.sinaisMarcas.testa),
          _divider,
          titulo("Outras descrições"),
          informacaoSemClipboard(
              widget.model.detalhes.sinaisMarcas.descricaoOutros),
        ]),
      ),
    ]);
  }

  bool exibirMandadosPrisao() => ValidatorsUtils.listNotNullAndNotEmpty(
      widget.model.detalhes.mandadoPrisao);

  Widget _listViewMandadosPrisao() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.model.detalhes.mandadoPrisao.length,
      itemBuilder: (BuildContext ctxt, int index) {
        return _buildRow(widget.model.detalhes.mandadoPrisao[index]);
      },
    );
  }

  Widget _buildRow(MandadoPrisao item) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                ProcessoMandadosDePrisaolUnicaConsultasView(model: item)));
      },
      child: Column(children: <Widget>[
        Container(
          padding: const EdgeInsets.all(11.0),
          child: Row(children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("${item.numeroProcesso} - ${item.seqPeca}",
                      style: FontDefaultStyles.sm_1()),
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

  Widget mandadosPrisaoNaoEncontrados() {
    return Padding(
        padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              informacaoSemClipboard("Nenhum mandados de prisão encontrado")
            ]));
  }

  Widget mandadosPrisao() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ContainerWidgets.getContainerTitle("Mandados de Prisão"),
          exibirMandadosPrisao()
              ? _listViewMandadosPrisao()
              : mandadosPrisaoNaoEncontrados(),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault.getAppComTitulo(titulo: "Dados"),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: new Column(
          children: <Widget>[
            dadosPessoais(),
            if (exibirCustodia()) custodia(),
            if (exibirSinaisEMarcas()) sinaisEMarcas(),
            if (exibirMandadosPrisao()) mandadosPrisao()
          ],
        ),
      ),
    );
  }
}
