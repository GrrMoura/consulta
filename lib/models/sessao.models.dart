import 'package:consulta_integrada/views-models/login_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sessao {
  String token;
  String usuario;
  int id;
  bool alterarSenha;
  List<String> regrasAcesso;
  String cpf;

  Sessao(
      {this.token,
      this.usuario,
      this.id,
      this.alterarSenha,
      this.regrasAcesso,
      this.cpf});

  Sessao.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    usuario = json['usuario'];
    id = json['id'];
    alterarSenha = json['alterarSenha'];
    regrasAcesso = json['regrasAcesso'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['usuario'] = this.usuario;
    data['id'] = this.id;
    data['alterarSenha'] = this.alterarSenha;
    data['regrasAcesso'] = this.regrasAcesso;
    return data;
  }

// CRIMES VIOLENTOS NAS REGRAS DE ACESSO
  Sessao.getSession(SharedPreferences prefs) {
    token = prefs.getString("token") ?? "";
    usuario = prefs.getString('usuario') ?? "";
    id = prefs.getInt('id') ?? 0;
    alterarSenha = prefs.getBool('alterarSenha') ?? false;
    regrasAcesso = prefs.getStringList('regrasAcesso');
    cpf = prefs.getString("cpf") ?? "";
  }

  void setSession(SharedPreferences prefs, LoginViewModel model) {
    prefs.setString("token", token);
    prefs.setString("usuario", usuario);
    prefs.setInt("id", id);
    prefs.setBool("alterarSenha", alterarSenha);
    prefs.setStringList("regrasAcesso", regrasAcesso);
    prefs.setString("cpf", model.login);
  }

  void clearSession(SharedPreferences prefs) {
    prefs.setString("token", null);
    prefs.setString("usuario", null);
    prefs.setInt("id", null);
    prefs.setBool("alterarSenha", null);
    prefs.setStringList("regrasAcesso", null);
  }
}
