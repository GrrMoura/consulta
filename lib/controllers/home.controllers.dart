import 'package:consulta_integrada/models/sessao.models.dart';
import 'package:consulta_integrada/views-models/home.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController {
  Future<void> carregarOpcoesPelasRegrasDeAcessoUsuario(
      List<BottomNavigationBarItem> _items) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var usuarioSessao = Sessao.getSession(prefs);

    //log("Token da API: " + usuarioSessao.token);

    var regrasAcessoUsuario = usuarioSessao.regrasAcesso;

    if (regrasAcessoUsuario.isNotEmpty) {
      List<String> regrasExigidasParaVisualizarMenuVeicular = [
        "ConsultaIntegradaVeicularCompleta",
        "ConsultaIntegradaVeicularSimples"
      ];
      addButtonItemSeContemRegra(
          regrasExigidasParaVisualizarMenuVeicular,
          regrasAcessoUsuario,
          Icon(Icons.directions_car_rounded),
          HomeViewModel.OPCAO_VEICULAR,
          _items);

      List<String> regrasExigidasParaVisualizarMenuUnica = [
        "ConsultaIntegradaIdentificacoesCriminais",
        "ConsultaIntegradaFichasCriminais",
        "ConsultaIntegradaIdentificacoesCivis",
        "ConsultaIntegradaMandadosPrisao",
        "ConsultaIntegradaMedidasProtetivas"
      ];
      addButtonItemSeContemRegra(
          regrasExigidasParaVisualizarMenuUnica,
          regrasAcessoUsuario,
          Icon(Icons.person_search),
          HomeViewModel.OPCAO_UNICA,
          _items);

      List<String> regrasExigidasParaVisualizarMenuIMEI = [
        "ConsultaIntegradaIMEICompleta",
        "ConsultaIntegradaIMEISimples"
      ];

      addButtonItemSeContemRegra(
          regrasExigidasParaVisualizarMenuIMEI,
          regrasAcessoUsuario,
          Icon(Icons.phone_android_sharp),
          HomeViewModel.OPCAO_IMEI,
          _items);

      List<String> regrasExigidasParaVisualizarMenuCNH = [
        "ConsultaIntegradaCNHCompleta",
        "ConsultaIntegradaCNHSimples"
      ];
      addButtonItemSeContemRegra(
          regrasExigidasParaVisualizarMenuCNH,
          regrasAcessoUsuario,
          Icon(Icons.account_balance_wallet_sharp),
          HomeViewModel.OPCAO_CNH,
          _items);
    }

    _items.add(getButtonItem(Icon(Icons.more_horiz), HomeViewModel.OPCAO_MAIS));
  }

  void addButtonItemSeContemRegra(
      List<String> regrasExigidasParaVisualizarMenu,
      List<String> regrasAssociadasAoUsuario,
      Icon iconItem,
      String iconLabel,
      List<BottomNavigationBarItem> _items) {
    if (seContemRegras(
        regrasExigidasParaVisualizarMenu, regrasAssociadasAoUsuario))
      _items.add(getButtonItem(iconItem, iconLabel));
  }

  bool seContemRegras(List<String> regrasExigidasParaVisualizarMenu,
      List<String> regrasAssociadasAoUsuario) {
    for (String regrasMenu in regrasExigidasParaVisualizarMenu) {
      if (regrasAssociadasAoUsuario.contains(regrasMenu)) return true;
    }
    return false;
  }

  BottomNavigationBarItem getButtonItem(Icon iconItem, String iconLabel) {
    return BottomNavigationBarItem(
      icon: iconItem,
      label: iconLabel,
    );
  }
}
