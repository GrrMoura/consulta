import 'package:consulta_integrada/views-models/termo.viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TermoController {

  static Future<TermoViewModel> getPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return new TermoViewModel(aceitoTermo: prefs.getBool('aceitoTermo') ?? false);
  }

  static Future<bool> setPreferences(TermoViewModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("aceitoTermo", model.aceitoTermo).then((bool success) {
      return true;
    });
    return false;
  }
}