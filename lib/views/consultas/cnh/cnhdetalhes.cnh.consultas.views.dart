import 'package:consulta_integrada/models/cnh.models.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/styles/widgets/clipboard.widgets.dart';
import 'package:consulta_integrada/styles/widgets/container.widgets.dart';
import 'package:flutter/material.dart';

class DetalhesCnhConsultasView extends StatefulWidget {
  DetalhesCnhConsultasView({Key key, this.model}) : super(key: key);

  final CnhModels model;

  @override
  _DetalhesCnhConsultasViewState createState() =>
      new _DetalhesCnhConsultasViewState();
}

class _DetalhesCnhConsultasViewState extends State<DetalhesCnhConsultasView> {
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

  @override
  Widget build(BuildContext context) {
    Widget restricoes() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ContainerWidgets.getContainerTitle("Restrições"),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Possui bloqueio",
                  style: _textStyleTitle,
                ),
                Text(
                  widget.model.possuiBloqueio.trim(),
                  style: FontDefaultStyles.smBold(),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget informacoesGerais() {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        ContainerWidgets.getContainerTitle("Informações gerais"),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Registro",
                  style: _textStyleTitle,
                ),
                informacaoComClipboard(widget.model.registro.trim()),
                _divider,
                Text(
                  "Data Emissão",
                  style: _textStyleTitle,
                ),
                Text(
                  widget.model.dataEmissao.trim(),
                  style: FontDefaultStyles.smBold(),
                ),
                _divider,
                Text(
                  "Validade",
                  style: _textStyleTitle,
                ),
                Text(
                  widget.model.validade.trim(),
                  style: FontDefaultStyles.smBold(),
                ),
                _divider,
                Text(
                  "Nome",
                  style: _textStyleTitle,
                ),
                informacaoComClipboard(widget.model.nome.trim()),
                _divider,
                Text(
                  "Identidade",
                  style: _textStyleTitle,
                ),
                informacaoComClipboard(widget.model.numeroIdentidade.trim()),
                _divider,
                Text(
                  "CPF",
                  style: _textStyleTitle,
                ),
                informacaoComClipboard(widget.model.cpf.trim()),
                _divider,
                Text(
                  "Data Nascimento",
                  style: _textStyleTitle,
                ),
                Text(
                  widget.model.dataNascimento.trim(),
                  style: FontDefaultStyles.smBold(),
                ),
                _divider,
                Text(
                  "Município Nascimento",
                  style: _textStyleTitle,
                ),
                Text(
                  widget.model.municipioNascimento.trim(),
                  style: FontDefaultStyles.smBold(),
                ),
                _divider,
                Text(
                  "Nome Mãe",
                  style: _textStyleTitle,
                ),
                Text(
                  widget.model.nomeMae.trim(),
                  style: FontDefaultStyles.smBold(),
                ),
                _divider,
                Text(
                  "Observações",
                  style: _textStyleTitle,
                ),
                Text(
                  widget.model.observacoes.trim(),
                  style: FontDefaultStyles.smBold(),
                ),
              ]),
        ),
      ]);
    }

    Widget endereco() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ContainerWidgets.getContainerTitle("Endereço do proprietário"),
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Logradouro",
                    style: _textStyleTitle,
                  ),
                  Text(
                    widget.model.endereco.rua.trim(),
                    style: FontDefaultStyles.smBold(),
                  ),
                  _divider,
                  Text(
                    "Complemento",
                    style: _textStyleTitle,
                  ),
                  Text(
                    widget.model.endereco.complemento.trim(),
                    style: FontDefaultStyles.smBold(),
                  ),
                  _divider,
                  Text(
                    "Bairro",
                    style: _textStyleTitle,
                  ),
                  Text(
                    widget.model.endereco.bairro.trim(),
                    style: FontDefaultStyles.smBold(),
                  ),
                  _divider,
                  Text(
                    "CEP",
                    style: _textStyleTitle,
                  ),
                  Text(
                    widget.model.endereco.cep.trim(),
                    style: FontDefaultStyles.smBold(),
                  ),
                  _divider,
                  Text(
                    "Município",
                    style: _textStyleTitle,
                  ),
                  Text(
                    widget.model.endereco.municipio.trim(),
                    style: FontDefaultStyles.smBold(),
                  ),
                ],
              ),
            ),
          ]);
    }

    return Scaffold(
      body: DefaultTextStyle(
        style: TextStyle(color: Colors.black),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    informacoesGerais(),
                    restricoes(),
                    if (widget.model.consultaCompleta) endereco()
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
