import 'package:consulta_integrada/controllers/autenticacao.controllers.dart';
import 'package:consulta_integrada/views-models/login_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  static final LocalAuthentication _localAuth = LocalAuthentication();
  static var model = LoginViewModel();
  static bool deviceSupported = false;

  static final _autenticacaoController = AutenticacaoController();

  static AndroidAuthMessages _androidAuthMessages() {
    return const AndroidAuthMessages(
        signInTitle: "Consulta Integrada",
        biometricHint: "",
        cancelButton: "Cancelar");
  }

// função para usar apenas a biometria e desativar a entrada com pin
  static Future<void> loginBiometrico(BuildContext context) async {
    bool authenticated = false;
    try {
      Loader.show(context);
      authenticated = await _localAuth.authenticate(
        androidAuthStrings: _androidAuthMessages(),
        localizedReason: 'Desbloqueie para ter acesso ao sistema.',
        useErrorDialogs: true,
        stickyAuth: true,
        biometricOnly: true,
      );

      if (authenticated) {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        model.login = prefs.getString("cpf");
        model.senha = prefs.getString("senha");
        model.leitorBiometrico = prefs.getBool("leitorBiometrico");

        _autenticacaoController.logar(context, model).then((value) {});
      } else {
        Loader.hide();
      }
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<bool> getValorDaOpcaoDeLembrarMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("lembrar_me") ?? false;
  }

  static Future<String> getValorDaCPF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String login = prefs.getString("cpf");
    return login ?? "";
  }

  static Future setLogin(String cpf) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("senha", cpf);
  }

  static Future<String> getValorDaSenha() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String senha = prefs.getString("senha");
    return senha ?? "";
  }

  static Future setSenha(String senha) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("senha", senha);
  }

  static Future<bool> getValorDaOpcaoDeLeituraBiometrica() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("leitorBiometrico") ?? false;
  }

  static Future setValorDaOpcaoDeLeituraBiometrica(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("leitorBiometrico", value);
  }

// analisando se o divice suporta o uso da biometria como login.
  static Future<bool> testandoSeBiometriaFunciona(BuildContext context) async {
    deviceSupported = await _localAuth.isDeviceSupported();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool("leitorBiometrico", deviceSupported);

    if (deviceSupported) {
      pegandoTiposBiometricos();
    }

    return deviceSupported;
  }

  //pegando os tipos disponiveis de biometria usaveis no device
  static Future<List<BiometricType>> pegandoTiposBiometricos() async {
    List<BiometricType> _availableBiometrics = <BiometricType>[];
    if (deviceSupported) {
      try {
        if (await _localAuth.canCheckBiometrics) {
          _availableBiometrics = await _localAuth.getAvailableBiometrics();
        }
        return _availableBiometrics;
      } catch (e) {
        return [];
      }
    }
    return [];
  }

  static Future<void> inicializar(
      BuildContext context, TextEditingController ctrl) async {
    try {
      SharedPreferences _prefes = await SharedPreferences.getInstance();
      bool biometria = _prefes.getBool("leitorBiometrico") ?? false;
      bool _lembrarMe = _prefes.getBool("lembrar_me") ?? false;
      String _usuario = _prefes.getString("cpf") ?? "";

      if (biometria) {
        LoginController.loginBiometrico(context);
        if (_lembrarMe) {
          ctrl.text = _usuario;
        }
      } else if (_lembrarMe) {
        ctrl.text = _usuario;
      }
    } catch (e) {
      return null;
    }
  }
}
