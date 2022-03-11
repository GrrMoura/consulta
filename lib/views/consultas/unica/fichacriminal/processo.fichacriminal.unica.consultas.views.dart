import 'package:consulta_integrada/models/fichacriminal.models.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/styles/widgets/appbar.widgets.dart';
import 'package:consulta_integrada/styles/widgets/clipboard.widgets.dart';
import 'package:consulta_integrada/styles/widgets/container.widgets.dart';
import 'package:consulta_integrada/utils/validators.utils.dart';
import 'package:flutter/material.dart';

class ProcessoFichaCriminalUnicaConsultasView extends StatefulWidget {
  final ProcessosCriminais model;

  ProcessoFichaCriminalUnicaConsultasView({Key key, this.model})
      : super(key: key);

  @override
  _ProcessoFichaCriminalUnicaConsultasViewState createState() =>
      new _ProcessoFichaCriminalUnicaConsultasViewState();
}

class _ProcessoFichaCriminalUnicaConsultasViewState
    extends State<ProcessoFichaCriminalUnicaConsultasView> {
  final _divider = Divider(
    color: DefaultTheme.getColor(),
    height: 20.0,
  );

  final _dividerBaixa = Divider(
    color: Colors.grey[800],
    height: 42.0,
    thickness: 2.0,
  );

  final _textStyleTitle =
      FontDefaultStyles.sm_1().apply(color: Colors.blue[900]);

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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
        Widget>[
      ContainerWidgets.getContainerTitle("Dados do processo"),
      Padding(
        padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              titulo("Número"),
              informacaoComClipboard(widget.model.numeroProcesso.trim()),
              _divider,
              titulo("Delegacia"),
              informacaoSemClipboard(widget.model.delegacia.trim()),
              _divider,
              titulo("Inquérito"),
              informacaoSemClipboard(widget.model.inquerito.trim()),
              _divider,
              titulo("Tipificações"),
              informacaoSemClipboard(
                  "${widget.model.tipificacao1} ${widget.model.tipificacao2} ${widget.model.tipificacao3} ${widget.model.tipificacao4} ${widget.model.tipificacao5} ${widget.model.tipificacao6}"),
              _divider,
              titulo("Endereço"),
              informacaoSemClipboard(widget.model.enderecoOcorrencia.trim()),
              _divider,
              titulo("Complemento"),
              informacaoSemClipboard(widget.model.complementoOcorrencia.trim()),
              _divider,
              titulo("Bairro"),
              informacaoSemClipboard(widget.model.bairroOcorrencia.trim()),
              _divider,
              titulo("Cidade"),
              informacaoSemClipboard(widget.model.cidadeOcorrencia.trim()),
              _divider,
              titulo("Estado"),
              informacaoSemClipboard(widget.model.estadoOcorrencia.trim()),
              _divider,
              titulo("Data"),
              informacaoSemClipboard(widget.model.dataOcorrencia.trim()),
              _divider,
              titulo("Ocorrência"),
              informacaoSemClipboard(widget.model.ocorrencia.trim()),
            ]),
      ),
    ]);
  }

  Widget baixasDoProcessos() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ContainerWidgets.getContainerTitle("Baixas do processo"),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (var b in widget.model.baixasProcessos) detalheBaixa(b)
              ]),
        ]);
  }

  Widget detalheBaixa(BaixasProcessos baixasProcessos) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                titulo("Data da baixa"),
                informacaoSemClipboard(baixasProcessos.dataBaixa.trim()),
                _divider,
                titulo("Motivo da baixa"),
                informacaoSemClipboard(baixasProcessos.motivoBaixa),
                _divider,
                titulo("Observação"),
                informacaoSemClipboard(
                    "${baixasProcessos.observacoesBaixa1} ${baixasProcessos.observacoesBaixa2}"),
                _divider,
                titulo("Condenação"),
                informacaoSemClipboard(baixasProcessos.condenacaoBaixa.trim()),
                _divider,
                titulo("Data da sentença"),
                informacaoSemClipboard(baixasProcessos.dataSentenca),
              ],
            ),
          ),
          _dividerBaixa
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
            dadosDoProcesso(),
            if (ValidatorsUtils.listNotNullAndNotEmpty(widget.model.baixasProcessos))
              baixasDoProcessos()
          ],
        ),
      ),
    );
  }
}
