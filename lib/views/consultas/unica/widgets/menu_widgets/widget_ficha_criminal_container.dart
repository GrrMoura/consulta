import 'package:consulta_integrada/models/itensfichacriminal.models.dart';
import 'package:consulta_integrada/styles/widgets/divider.widgets.dart';
import 'package:consulta_integrada/views-models/fichacriminal.consulta.unica.viewmodel.dart';
import 'package:consulta_integrada/views/consultas/unica/fichacriminal/lista.fichacriminal.unica.consultas.views.dart';
import 'package:consulta_integrada/views/consultas/unica/widgets/menu_widgets/class_mensagem_personalizada.dart';
import 'package:consulta_integrada/views/consultas/unica/widgets/menu_widgets/widget_container_generico.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FichaCriminalContainer extends StatelessWidget {
  var model;
  var consultaUnicaViewModel;
  MensagemPersonalizada _mensagemPersonalizada = MensagemPersonalizada();

  FichaCriminalContainer(this.model, this.consultaUnicaViewModel, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      InkWell(
        onTap: () {
          if (model.totalFichasCriminais > 0) {
            var fichaCriminalViewModel =
                new FichaCriminalConsultaUnicaViewModel(
                    nome: consultaUnicaViewModel.nome,
                    nomePai: consultaUnicaViewModel.nomePai,
                    nomeMae: consultaUnicaViewModel.nomeMae,
                    dataNascimento: consultaUnicaViewModel.dataNascimento,
                    alcunha: consultaUnicaViewModel.alcunha,
                    rg: consultaUnicaViewModel.rg,
                    cpf: consultaUnicaViewModel.cpf,
                    itensFichasCriminalModels: ItensFichaCriminalModels());
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ListaFichaCriminalUnicaConsultasView(
                    model: fichaCriminalViewModel)));
          }
        },
        child: ContainerGenericoUnica(
            "assets/icons/fichacriminal_icons.png",
            "Ficha Criminal",
            _mensagemPersonalizada
                .mensagemPersonalizada(model.totalFichasCriminais)),
      ),
      DividerWidgets.get()
    ]);
  }
}
