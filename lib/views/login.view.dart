import 'package:consulta_integrada/controllers/login_controller.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/views-models/login_view_model.dart';
import 'package:consulta_integrada/views/mais/configuracoes/configuracoesWidgets/botao_lembrar_me.dart';
import 'package:consulta_integrada/views/widgets/login/widget_login_button.dart';
import 'package:consulta_integrada/views/widgets/login/widget_senha_formField.dart';
import 'package:consulta_integrada/views/widgets/login/widgets_usuario_formField.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginViewState createState() => new _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var model = LoginViewModel();

  final _formKey = GlobalKey<FormState>();
  TextEditingController _usuarioCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _login();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: Center(
              child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(36),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 160,
                  child: Image.asset(
                    "ssp_logo.png",
                  ),
                ),
                Text("Consulta Integrada", style: FontDefaultStyles.md()),
                UsuarioTextField(model, _usuarioCtrl),
                SenhaTextField(model),
                LoginButton(model, _formKey),
                BotaoLembrarMe(model.lembrarMe)
              ],
            ),
          ),
        ),
      ))),
    );
  }

  Future<void> _login() async {
    try {
      SharedPreferences _prefes = await SharedPreferences.getInstance();
      bool biometria = _prefes.getBool("leitorBiometrico") ?? false;
      bool _lembrarMe = _prefes.getBool("lembrar_me") ?? false;
      String _usuario = _prefes.getString("cpf") ?? "";
      setState(() {
        model.lembrarMe = _lembrarMe ?? false;
      });

      if (biometria) {
        LoginController.loginBiometrico(context);
        if (_lembrarMe) {
          _usuarioCtrl.text = _usuario;
        }
      } else if (_lembrarMe) {
        _usuarioCtrl.text = _usuario;
      }
    } catch (e) {
      return null;
    }
  }
}
