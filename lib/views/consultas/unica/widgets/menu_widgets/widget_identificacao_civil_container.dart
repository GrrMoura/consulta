import 'package:consulta_integrada/models/itensidentificacaocivil.models.dart';
import 'package:consulta_integrada/styles/widgets/divider.widgets.dart';
import 'package:consulta_integrada/views-models/identificacaocivil.consulta.unica.viewmodel.dart';
import 'package:consulta_integrada/views/consultas/unica/identificacaocivil/lista.identificacaocivil.unica.consultas.views.dart';
import 'package:consulta_integrada/views/consultas/unica/widgets/menu_widgets/class_mensagem_personalizada.dart';
import 'package:consulta_integrada/views/consultas/unica/widgets/menu_widgets/widget_container_generico.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IdentificacaoCivilContainerr extends StatelessWidget {
  var consultaUnicaViewModel;
  var model;
  MensagemPersonalizada _mensagemPersonalizada = MensagemPersonalizada();

  IdentificacaoCivilContainerr(this.model, this.consultaUnicaViewModel,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      InkWell(
        onTap: () {
          if (model.totalCidadaos > 0) {
            var identificacaoCivilViewModel =
                new IdentificacaoCivilConsultaUnicaViewModel(
                    nome: consultaUnicaViewModel.nome,
                    nomePai: consultaUnicaViewModel.nomePai,
                    nomeMae: consultaUnicaViewModel.nomeMae,
                    dataNascimento: consultaUnicaViewModel.dataNascimento,
                    alcunha: consultaUnicaViewModel.alcunha,
                    rg: consultaUnicaViewModel.rg,
                    cpf: consultaUnicaViewModel.cpf,
                    itensIdentificacaoCriminalModels:
                        ItensIdentificacaoCivilModels());
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ListaIdentificacaoCivilUnicaConsultasView(
                    model: identificacaoCivilViewModel)));
          }
        },
        child: ContainerGenericoUnica(
            "assets/icons/biometria_icons.png",
            "Identificação Civil",
            _mensagemPersonalizada.mensagemPersonalizada(model.totalCidadaos)
            // mensagemPersonalizada(model.model.totalCidadaos),
            ),
      ),
      DividerWidgets.get()
    ]);
  }
}
