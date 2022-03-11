import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/views-models/consulta.viewmodel.dart';
import 'package:consulta_integrada/views/consultas/cnh/cpf.cnh.consultas.views.dart';
import 'package:consulta_integrada/views/consultas/cnh/registro.cnh.consultas.views.dart';
import 'package:flutter/material.dart';

class HomeCNHConsultasView extends StatefulWidget {
  @override
  _HomeCNHConsultasViewState createState() => new _HomeCNHConsultasViewState();
}

class _HomeCNHConsultasViewState extends State<HomeCNHConsultasView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: FontDefaultStyles.sm(),
                unselectedLabelStyle: FontDefaultStyles.sm(),
                unselectedLabelColor: Colors.black,
                indicatorColor: DefaultTheme.getColor(),
                labelColor: DefaultTheme.getColor(),
                tabs: [Tab(text: "CPF"), Tab(text: "Registro")],
              ),
            ),
            body: TabBarView(children: [
              CpfCnhConsultasView(model: CpfConsultaCnhViewModel()),
              RegistroCnhConsultasView(model: RegistroConsultaCnhViewModel()),
            ])),
      ),
    );
  }
}
