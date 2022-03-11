import 'package:consulta_integrada/models/veiculo.models.dart';
import 'package:consulta_integrada/styles/widgets/clipboard.widgets.dart';
import 'package:consulta_integrada/utils/format.utils.dart';
import 'package:consulta_integrada/views-models/detalhes.consultaveicular.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';

class DetalhesVeiculoVeicularConsultasView extends StatefulWidget {
  DetalhesVeiculoVeicularConsultasView({Key key, this.model}) : super(key: key);

  final VeiculoModels model;

  @override
  _DetalhesVeiculoVeicularConsultasViewState createState() =>
      new _DetalhesVeiculoVeicularConsultasViewState();
}

class _DetalhesVeiculoVeicularConsultasViewState
    extends State<DetalhesVeiculoVeicularConsultasView> {
  var model = new DetalhesConsultaViewModel();

  final _divider = Divider(
    color: DefaultTheme.getColor(),
    height: 20.0,
  );

  final _textStyleTitle =
      FontDefaultStyles.sm_1().apply(color: Colors.blue[900]);

  Container getContainerTitle(String title) {
    return Container(
      width: double.infinity,
      color: Colors.grey[300],
      padding: const EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 5.0),
      child: Text(
        title,
        style: FontDefaultStyles.sm(),
      ),
    );
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
    Widget debitosAtuaisVeiculo() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getContainerTitle("Débitos do ano atual"),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 15.0, top: 9.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Licenciamento",
                  style: _textStyleTitle,
                ),
                Text(
                  FormatUtils.formatarMoeda(
                      widget.model.debitos.totalLicenciamento),
                  style: FontDefaultStyles.smBold(),
                ),
                _divider,
                Text(
                  "IPVA",
                  style: _textStyleTitle,
                ),
                Text(
                  FormatUtils.formatarMoeda(widget.model.debitos.totalIpva),
                  style: FontDefaultStyles.smBold(),
                ),
                _divider,
                Text(
                  "Seguro",
                  style: _textStyleTitle,
                ),
                Text(
                  FormatUtils.formatarMoeda(widget.model.debitos.totalSeguro),
                  style: FontDefaultStyles.smBold(),
                ),
                _divider,
                Text(
                  "Multa",
                  style: _textStyleTitle,
                ),
                Text(
                  FormatUtils.formatarMoeda(widget.model.debitos.totalMulta),
                  style: FontDefaultStyles.smBold(),
                ),
                _divider,
                Text(
                  "Outros",
                  style: _textStyleTitle,
                ),
                Text(
                  FormatUtils.formatarMoeda(widget.model.debitos.totalOutros),
                  style: FontDefaultStyles.smBold(),
                ),
                _divider,
                Text(
                  "Total débitos",
                  style: _textStyleTitle,
                ),
                Text(
                  FormatUtils.formatarMoeda(
                      widget.model.debitos.totalDebitosGerais),
                  style: FontDefaultStyles.smBold(),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget identificacaoDoVeiculo() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getContainerTitle("Identificação do veículo"),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 15, top: 9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Renavam",
                  style: _textStyleTitle,
                ),
                informacaoComClipboard(widget.model.renavam.toString()),
                _divider,
                Text(
                  "Chassi",
                  style: _textStyleTitle,
                ),
                informacaoComClipboard(widget.model.chassi.trim()),
              ],
            ),
          ),
        ],
      );
    }

    Widget restricoesDoVeiculo() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getContainerTitle("Restrições"),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 15, top: 9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Restrição",
                  style: _textStyleTitle,
                ),
                Text(
                  widget.model.debitos.todasRestricoesNumaUnicaString(),
                  style: FontDefaultStyles.smBold(),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget informacoesDoVeiculo() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getContainerTitle("Informações gerais do veículo"),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 15, top: 9),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Proprietário",
                      style: _textStyleTitle,
                    ),
                    informacaoComClipboard(
                        widget.model.proprietario.nome.trim()),
                    _divider,
                    Text(
                      "Placa",
                      style: _textStyleTitle,
                    ),
                    informacaoComClipboard(widget.model.placa.trim()),
                    _divider,
                    Text(
                      "Município",
                      style: _textStyleTitle,
                    ),
                    Text(
                      widget.model.endereco.municipio.trim(),
                      style: FontDefaultStyles.smBold(),
                    ),
                    _divider,
                    Text(
                      "Ano de fabricação",
                      style: _textStyleTitle,
                    ),
                    Text(
                      widget.model.anoFabricacao.toString(),
                      style: FontDefaultStyles.smBold(),
                    ),
                    _divider,
                    Text(
                      "Tipo de veículo",
                      style: _textStyleTitle,
                    ),
                    Text(
                      widget.model.tipo.trim(),
                      style: FontDefaultStyles.smBold(),
                    ),
                    _divider,
                    Text(
                      "Cor",
                      style: _textStyleTitle,
                    ),
                    Text(
                      widget.model.cor.trim(),
                      style: FontDefaultStyles.smBold(),
                    ),
                    _divider,
                    Text(
                      "Categoria",
                      style: _textStyleTitle,
                    ),
                    Text(
                      widget.model.categoria.trim(),
                      style: FontDefaultStyles.smBold(),
                    ),
                    _divider,
                    Text(
                      "Espécie",
                      style: _textStyleTitle,
                    ),
                    Text(
                      widget.model.especie.trim(),
                      style: FontDefaultStyles.smBold(),
                    ),
                    _divider,
                    Text(
                      "Data do licenciamento",
                      style: _textStyleTitle,
                    ),
                    Text(
                      widget.model.debitos.dataLicenciamento.trim(),
                      style: FontDefaultStyles.smBold(),
                    ),
                  ]),
            ),
          ]);
    }

    Widget informacoesProprietario() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getContainerTitle("Identificação do proprietário"),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 15, top: 9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "CPF",
                    style: _textStyleTitle,
                  ),
                  informacaoComClipboard(widget.model.proprietario.cpf),
                  _divider,
                  Text(
                    "Endereço",
                    style: _textStyleTitle,
                  ),
                  Text(
                    widget.model.endereco.logradouro.trim(),
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
                    "Complemento",
                    style: _textStyleTitle,
                  ),
                  Text(
                    widget.model.endereco.complemento.trim(),
                    style: FontDefaultStyles.smBold(),
                  ),
                ],
              ),
            ),
          ]);
    }

    Widget debitosAtrasadosVeiculo() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getContainerTitle("Débitos atrasados"),
          Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 15, top: 9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Licenciamento",
                    style: _textStyleTitle,
                  ),
                  Text(
                    FormatUtils.formatarMoeda(
                        widget.model.debitos.licenciamentoAnterior),
                    style: FontDefaultStyles.smBold(),
                  ),
                  _divider,
                  Text(
                    "IPVA",
                    style: _textStyleTitle,
                  ),
                  Text(
                    FormatUtils.formatarMoeda(
                        widget.model.debitos.totalIpvaAnterior),
                    style: FontDefaultStyles.smBold(),
                  ),
                  _divider,
                  Text(
                    "Seguro",
                    style: _textStyleTitle,
                  ),
                  Text(
                    FormatUtils.formatarMoeda(
                        widget.model.debitos.totalSeguroAnterior),
                    style: FontDefaultStyles.smBold(),
                  ),
                  _divider,
                  Text(
                    "Multa",
                    style: _textStyleTitle,
                  ),
                  Text(
                    FormatUtils.formatarMoeda(
                        widget.model.debitos.totalMultaAnterior),
                    style: FontDefaultStyles.smBold(),
                  ),
                  _divider,
                  Text(
                    "Outros",
                    style: _textStyleTitle,
                  ),
                  Text(
                    FormatUtils.formatarMoeda(
                        widget.model.debitos.totalOutrosDebitosAnteriores),
                    style: FontDefaultStyles.smBold(),
                  ),
                  _divider,
                  Text(
                    "Total débitos",
                    style: _textStyleTitle,
                  ),
                  Text(
                    FormatUtils.formatarMoeda(
                        widget.model.debitos.totalGeralDebitosAnteriores),
                    style: FontDefaultStyles.smBold(),
                  ),
                ],
              )),
        ],
      );
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
                    informacoesDoVeiculo(),
                    restricoesDoVeiculo(),
                    identificacaoDoVeiculo(),
                    SizedBox(
                      height: model.heightBox,
                    ),
                    if (widget.model.consultaCompleta)
                      informacoesProprietario(),
                    debitosAtuaisVeiculo(),
                    debitosAtrasadosVeiculo()
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
