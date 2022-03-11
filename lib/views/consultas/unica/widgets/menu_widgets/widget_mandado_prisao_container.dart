import 'package:consulta_integrada/styles/widgets/divider.widgets.dart';
import 'package:consulta_integrada/utils/validators.utils.dart';
import 'package:consulta_integrada/views-models/mandadoprisao.consulta.unica.viewmodel.dart';
import 'package:consulta_integrada/views/consultas/unica/mandadosprisao/lista.mandadosprisao.unica.consultas.views.dart';
import 'package:consulta_integrada/views/consultas/unica/widgets/menu_widgets/class_mensagem_personalizada.dart';
import 'package:consulta_integrada/views/consultas/unica/widgets/menu_widgets/widget_container_generico.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MandadoPrisaoContainer extends StatelessWidget {
  var model;
  MensagemPersonalizada _mensagemPersonalizada = MensagemPersonalizada();
  MandadoPrisaoContainer(this.model, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      InkWell(
        onTap: () {
          if (model.totalMandadosPrisao > 0 &&
              ValidatorsUtils.listNotNullAndNotEmpty(model.mandadosPrisao)) {
            var mandadoPrisaoViewModel = MandadoPrisaoConsultaUnicaViewModel(
                mandadosPrisao: model.mandadosPrisao);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ListaMandadosPrisaoUnicaConsultasView(
                    model: mandadoPrisaoViewModel)));
          }
        },
        child: ContainerGenericoUnica(
          "assets/icons/algemas_icons.png",
          "Mandado de Prisão",
          _mensagemPersonalizada
              .mensagemPersonalizada(model.totalMandadosPrisao),
        ),
      ),
      DividerWidgets.get()
    ]);
  }
}
