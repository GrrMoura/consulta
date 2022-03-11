import 'package:consulta_integrada/controllers/autenticacao.controllers.dart';
import 'package:consulta_integrada/controllers/login_controller.dart';
import 'package:consulta_integrada/models/itensnotificacao.models.dart';
import 'package:consulta_integrada/models/notificacao.models.dart';
import 'package:consulta_integrada/models/notificacaosimplificada.models.dart';
import 'package:consulta_integrada/models/sessao.models.dart';
import 'package:consulta_integrada/services/autenticacao.services.dart';
import 'package:consulta_integrada/services/dispositivo.services.dart';
import 'package:consulta_integrada/services/notificacoes.services.dart';
import 'package:consulta_integrada/styles/widgets/snack.widgets.dart';
import 'package:consulta_integrada/views-models/configuracoes.mais.viewmodel.dart';
import 'package:consulta_integrada/views/consultas/unica/mandadosprisao/exibicao_foto_mandado_prisao.dart';
import 'package:consulta_integrada/views/login.view.dart';
import 'package:consulta_integrada/views/mais/configuracoes/home_view_configuracoes.dart';
import 'package:consulta_integrada/views/mais/notificacoes/detalhes.notificacoes.mais.views.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MaisController {
  Future<void> prepararParaNavegarParaConfiguracoesView(
      BuildContext context) async {
    // Carregando informação se usuário utiliza a leitura biométrica
    var _usarLeitorBiometrico =
        await LoginController.getValorDaOpcaoDeLeituraBiometrica();
    var _usarLembrarMe = await LoginController.getValorDaOpcaoDeLembrarMe();

    // Buscando o model da sessão para carregar nome e cpf
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var sessao = Sessao.getSession(prefs);

    // Criando o model da próxima view
    var model = ConfiguracoesMaisViewModel(
        usarLeitorBiometrico: _usarLeitorBiometrico,
        usarLembrarMe: _usarLembrarMe,
        nome: sessao.usuario,
        cpf: sessao.cpf);
    Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.size,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 400),
          reverseDuration: const Duration(milliseconds: 400),
          child: ConfiguracoesMaisConsultasView(
            model: model,
          ),
        ));
  }
  //TODO: PEDIR PRA LEANDRO TROCAR O CODIGO ERRO DE LOGIN OU SENHA POR 403

  Future<void> encerrarSessao(BuildContext context) async {
    SnackWidget.showSnackBar(context, "Encerrando sessão...");

    await DispositivoServices.verificarConexao().then((conectado) async {
      if (conectado) {
        AutenticacaoService.encerrarSessao();

        await AutenticacaoController.limparSessao();
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                duration: const Duration(milliseconds: 1500),
                child: LoginView()));
      } else {
        SnackWidget.showSnackBar(context,
            "Sem conexão com a internet. Estabeleça uma conexão e tente novamente.");
      }
    });
  }

  Future<void> buscarNotificacoes(
      BuildContext context, ItensNotificacaoModels model) async {
    Loader.show(context);

    await DispositivoServices.verificarConexao().then((conectado) async {
      if (conectado) {
        if (model.paginacao != null &&
            !model.paginacao.seChegouAoFinalDaPagina())
          model.paginacao.setProximaPagina();
        var responseBuscarNotificacoes =
            await NotificacaoServices.buscarNotificacoes(model.paginacao);
        if (responseBuscarNotificacoes.statusCode != 200) {
          Loader.hide();
          SnackWidget.showSnackBar(
              context, "Erro - ${responseBuscarNotificacoes.statusMessage}");
        } else {
          prepararModelNotificacoesParaView(model, responseBuscarNotificacoes);
          Loader.hide();
        }
      } else {
        Loader.hide();
        SnackWidget.showSnackBar(context,
            "Sem conexão com a internet. Estabeleça uma conexão e tente novamente.");
      }
    });
  }

  void prepararModelNotificacoesParaView(
      ItensNotificacaoModels model, Response response) {
    var itensNotificacaoModels = ItensNotificacaoModels.fromJson(response.data);
    if (model.notificacoes == null) model.notificacoes = [];
    model.notificacoes.addAll(itensNotificacaoModels.notificacoes);
    model.paginacao = itensNotificacaoModels.paginacao;
  }

  Future<void> buscarNotificacaoPorId(
      BuildContext context, NotificacaoModels model) async {
    Loader.show(context);

    await DispositivoServices.verificarConexao().then((conectado) async {
      if (conectado) {
        var responseBuscarNotificacaoPorId =
            await NotificacaoServices.buscarNotificacaoPorId(model);
        if (responseBuscarNotificacaoPorId.statusCode != 200) {
          Loader.hide();
          SnackWidget.showSnackBar(context,
              "Erro - ${responseBuscarNotificacaoPorId.statusMessage}");
        } else {
          Loader.hide();
          model.visualizada = true;
          var notificacaoSimplificada = NotificacaoSimplificadaModels.fromJson(
              responseBuscarNotificacaoPorId.data);

          Navigator.of(context).push(PageTransition(
              type: PageTransitionType.leftToRight,
              duration: const Duration(milliseconds: 400),
              reverseDuration: const Duration(milliseconds: 400),
              child: DetalhesNotificacoesMaisView(
                model: notificacaoSimplificada,
              )));
        }
      } else {
        Loader.hide();
        SnackWidget.showSnackBar(context,
            "Sem conexão com a internet. Estabeleça uma conexão e tente novamente.");
      }
    });
  }
}
