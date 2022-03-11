import 'package:consulta_integrada/models/itensidentificacaocriminal.models.dart';
import 'package:consulta_integrada/styles/widgets/divider.widgets.dart';
import 'package:consulta_integrada/views-models/identificacaocriminal.consulta.unica.viewmodel.dart';
import 'package:consulta_integrada/views/consultas/unica/identificacaocriminal/lista.identificacaocriminal.unica.consultas.views.dart';
import 'package:consulta_integrada/views/consultas/unica/widgets/menu_widgets/class_mensagem_personalizada.dart';
import 'package:consulta_integrada/views/consultas/unica/widgets/menu_widgets/widget_container_generico.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IdentificacaoCriminalContainer extends StatelessWidget {
  var consultaUnicaViewModel;
  var model;
  MensagemPersonalizada _mensagemPersonalizada = MensagemPersonalizada();

  IdentificacaoCriminalContainer(this.model, this.consultaUnicaViewModel,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      InkWell(
        onTap: () {
          if (model.totalIdentificacoesCriminais > 0) {
            var identificacaoCriminalViewModel =
                new IdentificacaoCriminalConsultaUnicaViewModel(
                    nome: consultaUnicaViewModel.nome,
                    nomePai: consultaUnicaViewModel.nomePai,
                    nomeMae: consultaUnicaViewModel.nomeMae,
                    dataNascimento: consultaUnicaViewModel.dataNascimento,
                    alcunha: consultaUnicaViewModel.alcunha,
                    rg: consultaUnicaViewModel.rg,
                    cpf: consultaUnicaViewModel.cpf,
                    itensIdentificacaoCriminalModels:
                        ItensIdentificacaoCriminalModels());
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    ListaIdentificacaoCriminalUnicaConsultasView(
                        model: identificacaoCriminalViewModel)));
          }
        },
        child: ContainerGenericoUnica(
            "assets/icons/identificacaocriminal_icons.png",
            "Identificação Criminal",
            _mensagemPersonalizada
                .mensagemPersonalizada(model.totalIdentificacoesCriminais)),
      ),
      DividerWidgets.get()
    ]);
  }
}
