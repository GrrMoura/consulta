import 'package:consulta_integrada/styles/widgets/divider.widgets.dart';
import 'package:consulta_integrada/views-models/medidasprotetivas.consulta.unica.viewmodel.dart';
import 'package:consulta_integrada/views/consultas/unica/medidasprotetivas/lista.medidasprotetivas.unica.consultas.views.dart';
import 'package:consulta_integrada/views/consultas/unica/widgets/menu_widgets/class_mensagem_personalizada.dart';
import 'package:consulta_integrada/views/consultas/unica/widgets/menu_widgets/widget_container_generico.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MedidaProtetivaContainer extends StatelessWidget {
  var model;
  var consultaUnicaViewModel;
  MensagemPersonalizada _mensagemPersonalizada = MensagemPersonalizada();

  MedidaProtetivaContainer(this.model, this.consultaUnicaViewModel, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      InkWell(
        onTap: () {
          if (model.totalMedidasProtetivas > 0) {
            var medidasProtetivasViewModel =
                MedidasProtetivasConsultaUnicaViewModel(
                    nome: consultaUnicaViewModel.nome,
                    nomePai: consultaUnicaViewModel.nomePai,
                    nomeMae: consultaUnicaViewModel.nomeMae,
                    dataNascimento: consultaUnicaViewModel.dataNascimento,
                    alcunha: consultaUnicaViewModel.alcunha,
                    rg: consultaUnicaViewModel.rg,
                    cpf: consultaUnicaViewModel.cpf,
                    medidasProtetivas: []);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ListaMedidasProtetivasUnicaConsultasView(
                    model: medidasProtetivasViewModel)));
          }
        },
        child: ContainerGenericoUnica(
          "assets/icons/medidaprotetiva_icons.png",
          "Medida Protetiva",
          _mensagemPersonalizada
              .mensagemPersonalizada(model.totalMedidasProtetivas),
        ),
      ),
      DividerWidgets.get()
    ]);
  }
}
