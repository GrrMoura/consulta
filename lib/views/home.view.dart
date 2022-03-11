import 'package:consulta_integrada/controllers/home.controllers.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/widgets/progressbar.widgets.dart';
import 'package:consulta_integrada/views-models/home.viewmodel.dart';
import 'package:consulta_integrada/views/consultas/cnh/home.cnh.consultas.views.dart';
import 'package:consulta_integrada/views/consultas/imei/home.imei.consultas.views.dart';
import 'package:consulta_integrada/views/consultas/unica/home.unica.consultas.views.dart';
import 'package:consulta_integrada/views/consultas/veicular/home.veicular.consultas.views.dart';
import 'package:consulta_integrada/views/mais/home.mais.views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => new _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var model = HomeViewModel();
  var controller = new HomeController();
  List<BottomNavigationBarItem> _items = [];

  void onTabTapped(int index) {
    setState(() {
      model.indiceBottomNavigationBar = index;
    });
  }

  Widget viewPeloIndice(int index) {
    var viewName = _items[index].label;
    switch (viewName) {
      case HomeViewModel.OPCAO_VEICULAR:
        return HomeVeicularConsultasView();
        break;
      case HomeViewModel.OPCAO_UNICA:
        return HomeUnicaConsultasView();
        break;
      case HomeViewModel.OPCAO_IMEI:
        return HomeImeiConsultasView();
        break;
      case HomeViewModel.OPCAO_CNH:
        return HomeCNHConsultasView();
        break;
      case HomeViewModel.OPCAO_MAIS:
        return HomeMaisConsultasView();
        break;
    }
    return null;
  }

  Widget _tabHomeView() {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Consulta Integrada', style: FontDefaultStyles.sm()),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: model.indiceBottomNavigationBar,
            type: BottomNavigationBarType.fixed,
            onTap: onTabTapped,
            items: _items),
        body: Center(child: viewPeloIndice(model.indiceBottomNavigationBar)),
      ),
    );
  }

  FutureBuilder _futureScreen() {
    return FutureBuilder(
        future: controller.carregarOpcoesPelasRegrasDeAcessoUsuario(_items),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              Loader.hide();
              return _tabHomeView();
              break;
            default:
              return ProgressBarkWidget.showProgressBar();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return _items.isNotEmpty ? _tabHomeView() : _futureScreen();
  }
}
