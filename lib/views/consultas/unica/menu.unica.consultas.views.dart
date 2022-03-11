import 'package:consulta_integrada/models/consultaunica.models.dart';
import 'package:consulta_integrada/styles/widgets/appbar.widgets.dart';
import 'package:consulta_integrada/views-models/consulta.unica.viewmodel.dart';
import 'package:consulta_integrada/views/consultas/unica/widgets/menu_widgets/widget_ficha_criminal_container.dart';
import 'package:consulta_integrada/views/consultas/unica/widgets/menu_widgets/widget_identificacao_criminal_container.dart';
import 'package:consulta_integrada/views/consultas/unica/widgets/menu_widgets/widget_identificacao_civil_container.dart';
import 'package:consulta_integrada/views/consultas/unica/widgets/menu_widgets/widget_mandado_prisao_container.dart';
import 'package:consulta_integrada/views/consultas/unica/widgets/menu_widgets/widget_medida_protetiva_container.dart';
import 'package:flutter/material.dart';

class MenuUnicaConsultasView extends StatefulWidget {
  final ConsultaUnicaModels model;
  final ConsultaUnicaViewModel consultaUnicaViewModel;

  MenuUnicaConsultasView({Key key, this.model, this.consultaUnicaViewModel})
      : super(key: key);

  @override
  _MenuUnicaConsultasViewState createState() =>
      new _MenuUnicaConsultasViewState();
}

class _MenuUnicaConsultasViewState extends State<MenuUnicaConsultasView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault.getAppComTitulo(titulo: "Resultado da Busca"),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              if (widget.model.CheckIdentCivil)
                IdentificacaoCivilContainerr(
                    widget.model, widget.consultaUnicaViewModel),
              if (widget.model.CheckIdentCriminal)
                IdentificacaoCriminalContainer(
                    widget.model, widget.consultaUnicaViewModel),
              if (widget.model.CheckFichaCriminal)
                FichaCriminalContainer(
                    widget.model, widget.consultaUnicaViewModel),
              if (widget.model.CheckMandadoPrisao)
                MandadoPrisaoContainer(widget.model),
              if (widget.model.CheckMedidaProtetiva)
                MedidaProtetivaContainer(
                    widget.model, widget.consultaUnicaViewModel),
            ],
          ),
        ),
      ),
    );
  }
}
