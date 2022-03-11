import 'package:consulta_integrada/models/mandadoprisaodetalhado.models.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/styles/widgets/appbar.widgets.dart';
import 'package:consulta_integrada/styles/widgets/container.widgets.dart';
import 'package:flutter/material.dart';

class ProcessoMandadosDePrisaolUnicaConsultasView extends StatefulWidget {
  final MandadoPrisao model;

  ProcessoMandadosDePrisaolUnicaConsultasView({Key key, this.model})
      : super(key: key);

  @override
  _ProcessoMandadosDePrisaolUnicaConsultasViewState createState() =>
      new _ProcessoMandadosDePrisaolUnicaConsultasViewState();
}

class _ProcessoMandadosDePrisaolUnicaConsultasViewState
    extends State<ProcessoMandadosDePrisaolUnicaConsultasView> {
  final _divider = Divider(
    color: DefaultTheme.getColor(),
    height: 20.0,
  );

  final _textStyleTitle =
  FontDefaultStyles.sm_1().apply(color: Colors.blue[900]);

  final _dividerBaixa = Divider(
    color: Colors.grey[800],
    height: 42.0,
    thickness: 2.0,
  );

  Widget informacaoSemClipboard(String value) {
    return Text(
      value != null ? value.trim() : "Não informado",
      style: FontDefaultStyles.smBold(),
    );
  }

  String getStringPorBool(bool value){
    return value ? "Sim" : "Não";
  }


  Widget titulo(String value) {
    return Text(
      value,
      style: _textStyleTitle,
    );
  }

  Widget detalhes() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ContainerWidgets.getContainerTitle("${widget.model.numeroProcesso} - ${widget.model.seqPeca}"),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  titulo("Data de Criação"),
                  informacaoSemClipboard(widget.model.dataCriacao),
                  _divider,
                  titulo("Tipo de Peça"),
                  informacaoSemClipboard(widget.model.tipoPeca),
                  _divider,
                  titulo("Número da Peça"),
                  informacaoSemClipboard(widget.model.numeroPeca),
                  _divider,
                  titulo("Nome do Servidor"),
                  informacaoSemClipboard(widget.model.nomeServidor),
                  _divider,
                  titulo("Cargo do Servidor"),
                  informacaoSemClipboard(widget.model.cargoServidor),
                  _divider,
                  titulo("Data da Confirmação"),
                  informacaoSemClipboard(widget.model.dataConfirmacaoServidor),
                  _divider,
                  titulo("Status"),
                  informacaoSemClipboard(widget.model.status),
                  _divider,
                  titulo("Justificativa de Cancelamento"),
                  informacaoSemClipboard(widget.model.textoJustificativaCancelamento),
                  _divider,
                  titulo("Data de Expedição"),
                  informacaoSemClipboard(widget.model.dataExpedicao),
                  _divider,
                  titulo("Data de Conclusão"),
                  informacaoSemClipboard(widget.model.dataConclusao),
                  _divider,
                  titulo("Data de Validade"),
                  informacaoSemClipboard(widget.model.dataValidade),
                  _divider,
                  titulo("Data da Expiração da Prisão"),
                  informacaoSemClipboard(widget.model.dataExpiracaoPrisaoMandadoPrisao),
                  _divider,
                  titulo("Data de Vencimento do Mandado de Prisão"),
                  informacaoSemClipboard(widget.model.dataVencimentoMandados),
                  _divider,
                  titulo("Órgão Judiciário"),
                  informacaoSemClipboard(widget.model.orgaoJudiciario),
                  _divider,
                  titulo("Prazo da prisão"),
                  informacaoSemClipboard(widget.model.numeroPrazoPrisao),
                  _divider,
                  titulo("Data da Infração"),
                  informacaoSemClipboard(widget.model.dataInfracao),
                  _divider,
                  titulo("Data da Prisão"),
                  informacaoSemClipboard(widget.model.dataPrisao),
                ]),
          ),
        ]);
  }


  Widget localOcorrencia() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ContainerWidgets.getContainerTitle("Descrição do Local da Ocorrência"),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  titulo("Síntese da Decisão"),
                  informacaoSemClipboard(widget.model.sinteseDecisao),
                  _divider,
                  titulo("Tempo da pena"),
                  informacaoSemClipboard("${widget.model.tempoPenaAno} Anos, ${widget.model.tempoPenaMes} Meses e ${widget.model.tempoPenaDia} Dias"),
                  _divider,
                  titulo("Descrição de Cumprimento"),
                  informacaoSemClipboard(widget.model.descricaoCumprimento),
                  _divider,
                  titulo("Observação"),
                  informacaoSemClipboard(widget.model.observacao),
                  _divider,
                  titulo("Sigilo"),
                  informacaoSemClipboard(widget.model.cargoServidor),
                  _divider,
                  titulo("Regime Prisional"),
                  informacaoSemClipboard(widget.model.regimePrisional),
                  _divider,
                  titulo("Espécie de Prisão"),
                  informacaoSemClipboard(widget.model.especiePrisao),
                  _divider,
                  titulo("Descrição de justificativa"),
                  informacaoSemClipboard(widget.model.descricaoJustificativa),
                  _divider,
                  titulo("Nome do Estabelecimento Prisional"),
                  informacaoSemClipboard(widget.model.nomeEstabelecimentoPrisional),
                  _divider,
                  titulo("Município"),
                  informacaoSemClipboard(widget.model.municipioCustodia),
                  _divider,
                  titulo("UF da Custódia"),
                  informacaoSemClipboard(widget.model.ufCustodia),
                ]),
          ),
        ]);
  }


  Widget tipificacoesCriminais() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ContainerWidgets.getContainerTitle("Tipificações Penais"),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (var tipificacaoPenal in widget.model.tipificacaoPenal) detalhesTipificacaoPenal(tipificacaoPenal)
              ]),
        ]);
  }

  Widget detalhesTipificacaoPenal(TipificacaoPenal tipificacaoPenal) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                titulo("Tipificação Penal"),
                informacaoSemClipboard(tipificacaoPenal.rotuloTipificacaoPenal),
                _divider,
                titulo("Rótulo da Categoria"),
                informacaoSemClipboard(tipificacaoPenal.rotuloCategoria),
                _divider,
                titulo("Nome da Categoria"),
                informacaoSemClipboard(tipificacaoPenal.nomeCategoriaTipificacaoPenal),
                _divider,
                titulo("Descrição da Categoria"),
                informacaoSemClipboard(tipificacaoPenal.descricaoCategoriaTipificacaoPenal),
                _divider,
                titulo("Crime Tentado"),
                informacaoSemClipboard(getStringPorBool(tipificacaoPenal.flgCrimeTentado)),
                _divider,
                titulo("Violência Doméstica"),
                informacaoSemClipboard(getStringPorBool(tipificacaoPenal.flgViolenciaDomestica)),
                _divider,
                titulo("Mulher"),
                informacaoSemClipboard(getStringPorBool(tipificacaoPenal.flgMulher)),
                _divider,
                titulo("Criança ou Adolescente"),
                informacaoSemClipboard(getStringPorBool(tipificacaoPenal.flgCriancaAdolescente)),
                _divider,
                titulo("Idoso"),
                informacaoSemClipboard(getStringPorBool(tipificacaoPenal.flgIdoso)),
              ],
            ),
          ),
          _dividerBaixa
        ]);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault.getAppComTitulo(titulo: "Processo"),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: new Column(
          children: <Widget>[
            detalhes(),
            localOcorrencia(),
            tipificacoesCriminais()
          ],
        ),
      ),
    );
  }
}
