import 'dart:typed_data';
import 'package:consulta_integrada/models/identificacaocriminal.models.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/styles/widgets/appbar.widgets.dart';
import 'package:consulta_integrada/styles/widgets/clipboard.widgets.dart';
import 'package:consulta_integrada/styles/widgets/container.widgets.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'exibicaofoto.identificacaocriminal.unica.consulta.views.dart';

class DetalhesIdentificacaoCriminalUnicaConsultasView extends StatefulWidget {
  final IdentificacaoCriminalModels model;

  DetalhesIdentificacaoCriminalUnicaConsultasView({Key key, this.model})
      : super(key: key);

  @override
  _DetalhesIdentificacaoCriminalUnicaConsultasViewState createState() =>
      new _DetalhesIdentificacaoCriminalUnicaConsultasViewState();
}

class _DetalhesIdentificacaoCriminalUnicaConsultasViewState
    extends State<DetalhesIdentificacaoCriminalUnicaConsultasView> {
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

  Widget avatarFoto(Uint8List foto) {
    return foto != null
        ? Padding(
            padding: EdgeInsets.all(20),
            child: InkWell(
              onTap: () {
                debugPrint("chegou aqui");
                Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.scale,
                      alignment: Alignment.center,
                      duration: const Duration(milliseconds: 500),
                      reverseDuration: const Duration(milliseconds: 500),
                      child:
                          ExibicaoFotoIdentificacaoCriminalUnicaConsultasView(
                              foto: foto),
                    ));
              },
              child: Container(
                height: 150,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: MemoryImage(foto), fit: BoxFit.fitHeight),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              ),
            ),
          )
        : Column(
            children: [
              Container(
                child: Image.asset(
                  "assets/icons/sem-fotos.png",
                  height: 150,
                ),
              ),
              SizedBox(height: 5),
              Text("SEM FOTO")
            ],
          );
  }

  Widget fotos() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ContainerWidgets.getContainerTitle("Fotos de frente e perfil"),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  avatarFoto(widget.model.fotoFrente.foto),
                  avatarFoto(widget.model.fotoLado.foto),
                ]),
          )
        ]);
  }

  Widget dadosPessoais() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
        Widget>[
      ContainerWidgets.getContainerTitle("Dados Pessoais"),
      Padding(
        padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          titulo("Nome do indiciado"),
          informacaoComClipboard(
              widget.model.identificacaoCriminal.nomeIndiciado.trim()),
          _divider,
          titulo("Alcunha (apelido)"),
          informacaoSemClipboard(
              widget.model.identificacaoCriminal.apelido.trim()),
          _divider,
          titulo("Data nascimento"),
          informacaoSemClipboard(
              widget.model.identificacaoCriminal.dataNascimento.trim()),
          _divider,
          titulo("CPF"),
          informacaoComClipboard(widget.model.identificacaoCriminal.cpf.trim()),
          _divider,
          titulo("RG"),
          informacaoComClipboard(widget.model.identificacaoCriminal.rg.trim()),
          _divider,
          titulo("Local de nascimento"),
          informacaoSemClipboard(
              widget.model.identificacaoCriminal.nomeLocalNascimento.trim()),
          _divider,
          titulo("Nacionalidade"),
          informacaoSemClipboard(
              widget.model.identificacaoCriminal.nomeNacionalidade.trim()),
          _divider,
          titulo("Nome da mãe"),
          informacaoSemClipboard(
              widget.model.identificacaoCriminal.nomeMae.trim()),
          _divider,
          titulo("Nome do pai"),
          informacaoSemClipboard(
              widget.model.identificacaoCriminal.nomePai.trim()),
          _divider,
          titulo("Título de eleitor"),
          informacaoSemClipboard(
              widget.model.identificacaoCriminal.titulo.trim()),
          _divider,
          titulo("Sexo"),
          informacaoSemClipboard(
              widget.model.identificacaoCriminal.nomeSexo.trim()),
          _divider,
          titulo("Profissão"),
          informacaoSemClipboard(
              widget.model.identificacaoCriminal.profissao.trim()),
          _divider,
          titulo("Endereço"),
          informacaoSemClipboard(
              widget.model.identificacaoCriminal.endereco.trim()),
          _divider,
          titulo("Endereço comercial"),
          informacaoSemClipboard(
              widget.model.identificacaoCriminal.enderecoComercial.trim()),
        ]),
      ),
    ]);
  }

  Widget dadosDoProcesso() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ContainerWidgets.getContainerTitle("Dados do processo"),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  titulo("Número do processo"),
                  informacaoComClipboard(
                      widget.model.identificacaoCriminal.codigoProcesso),
                  _divider,
                  titulo("Delegacia"),
                  informacaoSemClipboard(
                      widget.model.identificacaoCriminal.delegacia.trim()),
                  _divider,
                  titulo("Infração penal"),
                  informacaoSemClipboard(
                      widget.model.identificacaoCriminal.infracaoPenal.trim()),
                  _divider,
                  titulo("Juízo"),
                  informacaoSemClipboard(widget
                      .model.identificacaoCriminal.descricaoProcesso
                      .trim()),
                  _divider,
                  titulo("Nº do IP/TC"),
                  informacaoSemClipboard(widget
                      .model.identificacaoCriminal.numeroInqueritoPolicial
                      .trim()),
                  _divider,
                  titulo("Cidade"),
                  informacaoSemClipboard(
                      widget.model.identificacaoCriminal.cidade.trim()),
                  _divider,
                  titulo("Data atuação"),
                  informacaoSemClipboard(
                      widget.model.identificacaoCriminal.dataAutuacao.trim()),
                  _divider,
                  titulo("Data atuação"),
                  informacaoSemClipboard(
                      widget.model.identificacaoCriminal.nomeVitima.trim()),
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
          children: <Widget>[fotos(), dadosPessoais(), dadosDoProcesso()],
        ),
      ),
    );
  }
}
