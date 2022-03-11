import 'package:consulta_integrada/models/sessao.models.dart';
import 'package:consulta_integrada/services/autenticacao.services.dart';
import 'package:consulta_integrada/services/dispositivo.services.dart';
import 'package:consulta_integrada/styles/widgets/snack.widgets.dart';
import 'package:consulta_integrada/utils/configuracoesglobal.utils.dart';
import 'package:consulta_integrada/views-models/login_view_model.dart';
import 'package:consulta_integrada/views/home.view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AutenticacaoController {
  Future<void> logar(BuildContext context, LoginViewModel model) async {
    model.ocupado = true;

    await DispositivoServices.verificarConexao().then((conectado) async {
      if (conectado) {
        var response = await AutenticacaoService.logar(model);
        if (response.statusCode != 200) {
          SnackWidget.showSnackBar(context, "Erro - ${response.statusMessage}");
        } else {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Sessao.fromJson(response.data).setSession(prefs, model);

          await FirebaseMessaging.instance
              .subscribeToTopic(ConfiguracoesGlobalUtils.getTopicFirebase());

          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeView()));
        }
      } else {
        SnackWidget.showSnackBar(context,
            "Sem conexão com a internet. Estabeleça uma conexão e tente novamente.");
      }
      model.ocupado = false;
    });
  }

  Future<Sessao> getSessao() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var sessao = Sessao.getSession(prefs);
    return sessao;
  }

  static Future<void> limparSessao() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", "");
    prefs.setString("usuario", "");
    prefs.setInt("id", 0);
    prefs.setBool("alterarSenha", false);
    prefs.setStringList("regrasAcesso", []);
    prefs.setBool("leitorBiometrico", false);
    prefs.setBool("lembrar_me", false);
  }
}
