import 'package:consulta_integrada/models/identificacaocivil.models.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/styles/widgets/appbar.widgets.dart';
import 'package:consulta_integrada/styles/widgets/clipboard.widgets.dart';
import 'package:consulta_integrada/styles/widgets/container.widgets.dart';
import 'package:consulta_integrada/views/consultas/unica/identificacaocivil/exibicao_foto_identificacao_civil_consulta_unica.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class DetalhesIdentificacaoCivilUnicaConsultasView extends StatefulWidget {
  final IdentificacaoCivilModels model;

  DetalhesIdentificacaoCivilUnicaConsultasView({Key key, this.model})
      : super(key: key);

  @override
  _DetalhesIdentificacaoCivilUnicaConsultasViewState createState() =>
      new _DetalhesIdentificacaoCivilUnicaConsultasViewState();
}

class _DetalhesIdentificacaoCivilUnicaConsultasViewState
    extends State<DetalhesIdentificacaoCivilUnicaConsultasView> {
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

  Widget avatarFoto(foto) {
    return foto != null
        ? Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.scale,
                      alignment: Alignment.center,
                      duration: const Duration(milliseconds: 500),
                      reverseDuration: const Duration(milliseconds: 500),
                      child: ExibicaoFotoIdentificacaoCivilUnicaConsultasView(
                          foto: foto),
                    ));
              },
              child: Container(
                height: 150,
                width: 90,
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
                  Center(child: avatarFoto(widget.model.foto)),
                  titulo("Nome"),
                  informacaoComClipboard(widget.model.nome.trim()),
                  _divider,
                  titulo("Data nascimento"),
                  informacaoSemClipboard(widget.model.dataNascimento),
                  _divider,
                  titulo("CPF"),
                  informacaoComClipboard(widget.model.cpf),
                  _divider,
                  titulo("RG"),
                  informacaoComClipboard(widget.model.rg),
                  _divider,
                  titulo("Naturalidade"),
                  informacaoSemClipboard(widget.model.naturalidade),
                  _divider,
                  titulo("Filiação"),
                  informacaoSemClipboard(widget.model.getFiliacoes()),
                  _divider,
                  titulo("Profissão"),
                  informacaoSemClipboard(widget.model.profissao),
                  _divider,
                  titulo("Sexo"),
                  informacaoSemClipboard(widget.model.sexo),
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
                  titulo("Cidade"),
                  informacaoSemClipboard(widget.model.cidadeEndereco),
                  _divider,
                  titulo("Bairro"),
                  informacaoSemClipboard(widget.model.bairro),
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
          children: <Widget>[dadosPessoais(), endereco()],
        ),
      ),
    );
  }
}
