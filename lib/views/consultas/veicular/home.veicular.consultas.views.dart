import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/views-models/consulta.viewmodel.dart';
import 'package:consulta_integrada/views/consultas/veicular/chassi.veicular.consultas.views.dart';
import 'package:consulta_integrada/views/consultas/veicular/placa.veicular.consultas.views.dart';
import 'package:consulta_integrada/views/consultas/veicular/renavam.veicular.consultas.views.dart';
import 'package:flutter/material.dart';

class HomeVeicularConsultasView extends StatefulWidget {
  @override
  _HomeVeicularConsultasViewState createState() =>
      new _HomeVeicularConsultasViewState();
}

class _HomeVeicularConsultasViewState extends State<HomeVeicularConsultasView>
    with TickerProviderStateMixin {

  @override
  void initState() {
    //_tabController = TabController(length: 3, vsync: this);
    //_scrollViewController = ScrollController(initialScrollOffset: 0.0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: TabBar(
              labelStyle: FontDefaultStyles.sm(),
              unselectedLabelStyle: FontDefaultStyles.sm(),
              unselectedLabelColor: Colors.black,
              indicatorColor: DefaultTheme.getColor(),
              labelColor: DefaultTheme.getColor(),
              tabs: [
                Tab(text: "Placa"),
                Tab(text: "Renavam"),
                Tab(text: "Chassi")
              ],
            ),),

            body: TabBarView (
              children: [
                PlacaVeicularConsultasView(model: PlacaConsultaVeicularViewModel()),
                RenavamVeicularConsultasView(model: RenavamConsultaVeicularViewModel()),
                ChassiVeicularConsultasView(model: ChassiConsultaVeicularViewModel()),
              ]
            )
          ),
        ),
      );
  }
}
