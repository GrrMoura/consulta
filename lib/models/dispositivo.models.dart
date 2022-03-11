import 'package:consulta_integrada/utils/configuracoesglobal.utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DispositivoModels {

  String idDispositivo;
  String fabricante;
  String modelo;
  String so;
  String versaoSo;
  String token;
  bool cadastrado;
  bool liberado;

  DispositivoModels({this.idDispositivo, this.fabricante, this.modelo, this.so, this.versaoSo, this.token});

  String getHeader() => "MobileInformation";

  String getHeaderData() => "${ConfiguracoesGlobalUtils.ID_SISTEMA};${this.idDispositivo};${this.fabricante};${this.modelo};${this.so};${this.versaoSo}";

  DispositivoModels.getPreferences(SharedPreferences prefs) {
    cadastrado = prefs.getBool('cadastrado') ?? false;
    liberado = prefs.getBool('liberado') ?? false;
  }

  setPreferences(SharedPreferences prefs){
    prefs.setBool("cadastrado", cadastrado);
    prefs.setBool("liberado", liberado);
  }


}