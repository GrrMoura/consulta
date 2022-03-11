import 'package:consulta_integrada/models/veiculo_models_detranSE.dart';
import 'package:consulta_integrada/models/veiculo_models_nacional.dart';
import 'package:consulta_integrada/views/consultas/veicular/widget_veicular/base_detranSE.dart';
import 'package:consulta_integrada/views/consultas/veicular/widget_veicular/base_nacional.dart';
import 'package:consulta_integrada/views/consultas/veicular/widget_veicular/erro_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';

class DetalhesVeiculoVeicularConsultasVieww extends StatefulWidget {
  DetalhesVeiculoVeicularConsultasVieww(
      {Key key, this.modelsNacional, this.modelsDetran})
      : super(key: key);

  final VeiculoModelsDetran modelsDetran;
  final VeiculoModelsNacional modelsNacional;

  @override
  _DetalhesVeiculoVeicularConsultasViewwState createState() =>
      new _DetalhesVeiculoVeicularConsultasViewwState();
}

class _DetalhesVeiculoVeicularConsultasViewwState
    extends State<DetalhesVeiculoVeicularConsultasVieww> {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: FontDefaultStyles.sm(),
                unselectedLabelStyle: FontDefaultStyles.sm(),
                unselectedLabelColor: Colors.black,
                indicatorColor: DefaultTheme.getColor(),
                labelColor: DefaultTheme.getColor(),
                tabs: [
                  Tab(text: "Base Nacional"),
                  Tab(text: "Base Estadual"),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                widget.modelsNacional.baseNacional
                    ? BaseNacional(widget.modelsNacional)
                    : ErroView(),
                widget.modelsDetran.baseDetran
                    ? BaseDetran(widget.modelsDetran)
                    : ErroView(),
              ],
            )),
      ),
    );
  }
}
