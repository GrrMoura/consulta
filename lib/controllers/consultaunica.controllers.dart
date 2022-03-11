import 'package:consulta_integrada/models/cidadao.models.dart';
import 'package:consulta_integrada/models/consultaunica.models.dart';
import 'package:consulta_integrada/models/identificacaocivil.models.dart';
import 'package:consulta_integrada/models/fichacriminal.models.dart';
import 'package:consulta_integrada/models/identificacaocriminal.models.dart';
import 'package:consulta_integrada/models/itensidentificacaocivil.models.dart';
import 'package:consulta_integrada/models/itensfichacriminal.models.dart';
import 'package:consulta_integrada/models/itensidentificacaocriminal.models.dart';
import 'package:consulta_integrada/models/mandadoprisaodetalhado.models.dart';
import 'package:consulta_integrada/models/mandadosprisao.models.dart';
import 'package:consulta_integrada/models/opcao.models.dart';
import 'package:consulta_integrada/models/opcoesconsultaunica.models.dart';
import 'package:consulta_integrada/models/sessao.models.dart';
import 'package:consulta_integrada/services/consultaunica.services.dart';
import 'package:consulta_integrada/services/dispositivo.services.dart';
import 'package:consulta_integrada/styles/widgets/snack.widgets.dart';
import 'package:consulta_integrada/views-models/consulta.unica.viewmodel.dart';
import 'package:consulta_integrada/views-models/home.consulta.unica.viewmodel.dart';
import 'package:consulta_integrada/views-models/identificacaocivil.consulta.unica.viewmodel.dart';
import 'package:consulta_integrada/views-models/fichacriminal.consulta.unica.viewmodel.dart';
import 'package:consulta_integrada/views-models/identificacaocriminal.consulta.unica.viewmodel.dart';
import 'package:consulta_integrada/views-models/medidasprotetivas.consulta.unica.viewmodel.dart';
import 'package:consulta_integrada/views/consultas/unica/fichacriminal/detalhes.fichacriminal.unica.views.dart';
import 'package:consulta_integrada/views/consultas/unica/identificacaocivil/detalhes.identificacaocivil.unica.consultas.views.dart';
import 'package:consulta_integrada/views/consultas/unica/identificacaocriminal/detalhes.identificacaocriminal.unica.consultas.views.dart';
import 'package:consulta_integrada/views/consultas/unica/mandadosprisao/detalhes.mandadosprisao.unica.consultas.views.dart';
import 'package:consulta_integrada/views/consultas/unica/menu.unica.consultas.views.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConsultaUnicaController {
  Future<void> carregarOpcoesFiltroPorNivelDeAcesso(
      HomeConsultaUnicaViewModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _regrasAcesso = Sessao.getSession(prefs).regrasAcesso;

    // Carregando opções de acordo com nível de acesso
    ConsultaUnicaService.seContemRegraAddOpcao(
        _regrasAcesso,
        model.opcoesFiltro,
        "ConsultaIntegradaIdentificacoesCivis",
        OpcaoConsultaUnicaModels.opcaoIdentificacaoCivil());
    ConsultaUnicaService.seContemRegraAddOpcao(
        _regrasAcesso,
        model.opcoesFiltro,
        "ConsultaIntegradaIdentificacoesCriminais",
        OpcaoConsultaUnicaModels.opcaoIdentificacaoCriminal());
    ConsultaUnicaService.seContemRegraAddOpcao(
        _regrasAcesso,
        model.opcoesFiltro,
        "ConsultaIntegradaFichasCriminais",
        OpcaoConsultaUnicaModels.opcaoFichaCriminal());
    ConsultaUnicaService.seContemRegraAddOpcao(
        _regrasAcesso,
        model.opcoesFiltro,
        "ConsultaIntegradaMandadosPrisao",
        OpcaoConsultaUnicaModels.opcaoMandadoDePrisao());
    ConsultaUnicaService.seContemRegraAddOpcao(
        _regrasAcesso,
        model.opcoesFiltro,
        "ConsultaIntegradaMedidasProtetivas",
        OpcaoConsultaUnicaModels.opcaoMedidasProtetivas());

    // Carregando itens do filtro
    model.items = model.opcoesFiltro
        .map((opcao) => MultiSelectItem<OpcaoModels>(opcao, opcao.nome))
        .toList();

    // Definindo todas as opções como já selecionadas
    model.opcoesSelecionadas = model.opcoesFiltro;
  }

  Future<void> consultar(
      BuildContext context, HomeConsultaUnicaViewModel model) async {
    model.ocupado = true;

    await DispositivoServices.verificarConexao().then((conectado) async {
      if (conectado) {
        prepararModelParaRequisicao(model);
        var responseConsultaUnica = await ConsultaUnicaService.consulta(model);

        if (responseConsultaUnica.statusCode != 200) {
          SnackWidget.showSnackBar(
              context, "Erro - ${responseConsultaUnica.statusMessage}");
        } else {
          var consultaUnicaModel = ConsultaUnicaModels.fromJsonViewModel(
              responseConsultaUnica.data, model);
          var consultaUnicaViewModel = homeParaConsultaUnicaViewModel(model);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MenuUnicaConsultasView(
                    model: consultaUnicaModel,
                    consultaUnicaViewModel: consultaUnicaViewModel,
                  )));
        }
      } else {
        SnackWidget.showSnackBar(context,
            "Sem conexão com a internet. Estabeleça uma conexão e tente novamente.");
      }
      model.ocupado = false;
    });
  }

  ConsultaUnicaViewModel homeParaConsultaUnicaViewModel(
      HomeConsultaUnicaViewModel model) {
    var consultaUnicaViewModel = ConsultaUnicaViewModel(
      nome: model.nome,
      nomePai: model.nomePai,
      nomeMae: model.nomeMae,
      dataNascimento: model.dataNascimento,
      alcunha: model.alcunha,
      rg: model.rg,
      cpf: model.cpf,
    );
    return consultaUnicaViewModel;
  }

  void prepararModelParaRequisicao(HomeConsultaUnicaViewModel model) {
    model.CheckIdentCivil = ConsultaUnicaService.seContemOpcao(
        OpcaoConsultaUnicaModels.opcaoIdentificacaoCivil().id,
        model.opcoesSelecionadas);
    model.CheckIdentCriminal = ConsultaUnicaService.seContemOpcao(
        OpcaoConsultaUnicaModels.opcaoIdentificacaoCriminal().id,
        model.opcoesSelecionadas);
    model.CheckFichaCriminal = ConsultaUnicaService.seContemOpcao(
        OpcaoConsultaUnicaModels.opcaoFichaCriminal().id,
        model.opcoesSelecionadas);
    model.CheckMedidaProtetiva = ConsultaUnicaService.seContemOpcao(
        OpcaoConsultaUnicaModels.opcaoMedidasProtetivas().id,
        model.opcoesSelecionadas);
    model.CheckMandadoPrisao = ConsultaUnicaService.seContemOpcao(
        OpcaoConsultaUnicaModels.opcaoMandadoDePrisao().id,
        model.opcoesSelecionadas);
  }

  //#region Ficha Criminal

  Future<void> buscarFichasCriminais(
      BuildContext context, FichaCriminalConsultaUnicaViewModel model) async {
    Loader.show(context);

    await DispositivoServices.verificarConexao().then((conectado) async {
      if (conectado) {
        if (model.paginacao != null &&
            !model.paginacao.seChegouAoFinalDaPagina()) {
          model.paginacao.setProximaPagina();
        }
        var responseConsultaFichasCriminais =
            await ConsultaUnicaService.consultaFichasCriminais(model);

        if (responseConsultaFichasCriminais.statusCode != 200) {
          SnackWidget.showSnackBar(context,
              "Erro - ${responseConsultaFichasCriminais.statusMessage}");
        } else {
          prepararModelFichaCriminaisParaAView(
              model, responseConsultaFichasCriminais);
        }
      } else {
        Loader.hide();
        SnackWidget.showSnackBar(context, "Sem conexão com a internet.");
      }
      Loader.hide();
    });
  }

  void prepararModelFichaCriminaisParaAView(
      FichaCriminalConsultaUnicaViewModel model, Response response) {
    var itensFichaCriminaisModel =
        ItensFichaCriminalModels.fromJson(response.data);
    if (model.itensFichasCriminalModels.fichasCriminais == null)
      model.itensFichasCriminalModels.fichasCriminais = [];
    model.itensFichasCriminalModels.fichasCriminais
        .addAll(itensFichaCriminaisModel.fichasCriminais);
    model.paginacao = itensFichaCriminaisModel.paginacao;
  }

  Future<void> buscarFichaCriminalPorId(
      BuildContext context, ItemFichasCriminais model) async {
    Loader.show(context);

    await DispositivoServices.verificarConexao().then((conectado) async {
      if (conectado) {
        var response =
            await ConsultaUnicaService.consultaFichaCriminalPorId(model);

        if (response.statusCode != 200) {
          Loader.hide();
          SnackWidget.showSnackBar(context, "Erro - ${response.statusMessage}");
        } else {
          var fichaCriminalModel = FichaCriminalModels.fromJson(response.data);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetalhesFichaCriminalUnicaConsultasView(
                    model: fichaCriminalModel,
                  )));
        }
      } else {
        SnackWidget.showSnackBar(context, "Sem conexão com a internet.");
      }
      Loader.hide();
    });
  }

  //#endregion

  //#region Identificação Civil

  Future<void> buscarIdentificacoesCivis(BuildContext context,
      IdentificacaoCivilConsultaUnicaViewModel model) async {
    Loader.show(context);

    await DispositivoServices.verificarConexao().then((conectado) async {
      if (conectado) {
        if (model.paginacao != null &&
            !model.paginacao.seChegouAoFinalDaPagina()) {
          var x = model.paginacao.seChegouAoFinalDaPagina();
          debugPrint(x.toString());

          model.paginacao.setProximaPagina();
        }
        var responseConsultaIdentificacoesCriminais =
            await ConsultaUnicaService.consultaIdentificacoesCivis(model);
        if (responseConsultaIdentificacoesCriminais.statusCode != 200) {
          Loader.hide();
          SnackWidget.showSnackBar(context,
              "Erro - ${responseConsultaIdentificacoesCriminais.statusMessage}");
        } else {
          prepararModelIdentificacoesCivisParaAView(
              model, responseConsultaIdentificacoesCriminais);
        }
      } else {
        SnackWidget.showSnackBar(context, "Sem conexão com a internet.");
      }

      Loader.hide();
    });
  }

  void prepararModelIdentificacoesCivisParaAView(
      IdentificacaoCivilConsultaUnicaViewModel model, Response response) {
    var itensIdentificacoesCivilModel =
        ItensIdentificacaoCivilModels.fromJson(response.data);
    if (model.itensIdentificacaoCriminalModels.cidadaos == null)
      model.itensIdentificacaoCriminalModels.cidadaos = [];
    model.itensIdentificacaoCriminalModels.cidadaos
        .addAll(itensIdentificacoesCivilModel.cidadaos);
    model.paginacao = itensIdentificacoesCivilModel.paginacao;
  }

  Future<void> buscarIdentificacaoCivilPorId(
      BuildContext context, Cidadao model) async {
    Loader.show(context);

    await DispositivoServices.verificarConexao().then((conectado) async {
      if (conectado) {
        var response =
            await ConsultaUnicaService.consultaIdentificacaoCivilPorId(model);
        if (response.statusCode != 200) {
          Loader.hide();
          SnackWidget.showSnackBar(context, "Erro - ${response.statusMessage}");
        } else {
          var identificacaoCivilModel =
              IdentificacaoCivilModels.fromJson(response.data);
          Loader.hide();
          await buscarFotoPorId(context, identificacaoCivilModel);

          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  DetalhesIdentificacaoCivilUnicaConsultasView(
                    model: identificacaoCivilModel,
                  )));
        }
      } else {
        SnackWidget.showSnackBar(context, "Sem conexão com a internet.");
      }
      Loader.hide();
    });
  }

  Future<void> buscarFotoPorId(
      BuildContext context, IdentificacaoCivilModels model) async {
    if (model.idMidiaFoto != null) {
      var response =
          await ConsultaUnicaService.consultaFotoPorIdMidiaFoto(model);
      model.foto = response;
    } else {}
  }

  //#endregion

  //#region Identificação Criminal

  Future<void> buscarIdentificacoesCriminais(BuildContext context,
      IdentificacaoCriminalConsultaUnicaViewModel model) async {
    Loader.show(context);

    await DispositivoServices.verificarConexao().then((conectado) async {
      if (conectado) {
        if (model.paginacao != null &&
            !model.paginacao.seChegouAoFinalDaPagina())
          model.paginacao.setProximaPagina();
        var responseConsultaFichasCriminais =
            await ConsultaUnicaService.consultaIdentificacoesCriminais(model);
        if (responseConsultaFichasCriminais.statusCode != 200) {
          Loader.hide();
          SnackWidget.showSnackBar(context,
              "Erro - ${responseConsultaFichasCriminais.statusMessage}");
        } else {
          prepararModelIdentificacaoCriminaisParaAView(
              model, responseConsultaFichasCriminais);
        }
      } else {
        SnackWidget.showSnackBar(context, "Sem conexão com a internet.");
      }
      Loader.hide();
    });
  }

  void prepararModelIdentificacaoCriminaisParaAView(
      IdentificacaoCriminalConsultaUnicaViewModel model, Response response) {
    var itensIdentificacaoCriminalModel =
        ItensIdentificacaoCriminalModels.fromJson(response.data);
    if (model.itensIdentificacaoCriminalModels.identificacoesCriminais == null)
      model.itensIdentificacaoCriminalModels.identificacoesCriminais = [];
    model.itensIdentificacaoCriminalModels.identificacoesCriminais
        .addAll(itensIdentificacaoCriminalModel.identificacoesCriminais);
    model.paginacao = itensIdentificacaoCriminalModel.paginacao;
  }

  Future<void> buscarIdentificacaoCriminalPorId(
      BuildContext context, ItemIdentificacoesCriminais model) async {
    Loader.show(context);

    await DispositivoServices.verificarConexao().then((conectado) async {
      if (conectado) {
        var response =
            await ConsultaUnicaService.consultaIdentificacaoCriminalPorId(
                model);
        if (response.statusCode != 200) {
          Loader.hide();
          SnackWidget.showSnackBar(context, "Erro - ${response.statusMessage}");
        } else {
          var identificacaoCriminalModel =
              IdentificacaoCriminalModels.fromJson(response.data);
          await buscarFotosIdentificacaoCriminalPorId(
              identificacaoCriminalModel);
          Loader.hide();
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  DetalhesIdentificacaoCriminalUnicaConsultasView(
                    model: identificacaoCriminalModel,
                  )));
        }
      } else {
        SnackWidget.showSnackBar(context, "Sem conexão com a internet.");
      }
      Loader.hide();
    });
  }

  Future<void> buscarFotosIdentificacaoCriminalPorId(
      IdentificacaoCriminalModels model) async {
    if (model.fotoFrente != null)
      model.fotoFrente.foto =
          await ConsultaUnicaService.consultaFotoIdentificacaoCriminalPorId(
              model.identificacaoCriminal.id, model.fotoFrente.idTipo);
    if (model.fotoLado != null)
      model.fotoLado.foto =
          await ConsultaUnicaService.consultaFotoIdentificacaoCriminalPorId(
              model.identificacaoCriminal.id, model.fotoLado.idTipo);
  }

//#endregion

  //#region Medidas Protetivas
  Future<void> buscarMedidasProtetivas(BuildContext context,
      MedidasProtetivasConsultaUnicaViewModel model) async {
    Loader.show(context);

    await DispositivoServices.verificarConexao().then((conectado) async {
      if (conectado) {
        if (model.paginacao != null &&
            !model.paginacao.seChegouAoFinalDaPagina()) {
          model.paginacao.setProximaPagina();
        }
        var responseConsultaMedidasProtetivas =
            await ConsultaUnicaService.consultaMedidasProtetivas(model);
        if (responseConsultaMedidasProtetivas.statusCode != 200) {
          Loader.hide();
          Future.delayed(Duration(microseconds: 800), () {
            SnackWidget.showSnackBar(context,
                "Erro - ${responseConsultaMedidasProtetivas.statusMessage}");
          });
        } else {
          Loader.hide();
          prepararModelMedidaProtetivaParaAView(
              model, responseConsultaMedidasProtetivas);
        }
      } else {
        Loader.hide();
        Future.delayed(Duration(seconds: 1), () {
          SnackWidget.showSnackBar(context, "Sem conexão com a internet.");
        });
      }
      Loader.hide();
    });
  }

  void prepararModelMedidaProtetivaParaAView(
      MedidasProtetivasConsultaUnicaViewModel model, Response response) {
    var medidasProtetivas =
        MedidasProtetivasConsultaUnicaViewModel.fromJson(response.data);
    if (model.medidasProtetivas == null) model.medidasProtetivas = [];
    model.medidasProtetivas.addAll(medidasProtetivas.medidasProtetivas);
    model.paginacao = medidasProtetivas.paginacao;
  }

  //#endregion

  //#region Mandados de Prisão

  Future<void> buscarMandadosDePrisaoPorId(
      BuildContext context, MandadosPrisaoModels model) async {
    await DispositivoServices.verificarConexao().then((conectado) async {
      Loader.show(context);
      if (conectado) {
        var responseBuscaMandadoDePrisaoPorId =
            await ConsultaUnicaService.buscarMandadosDePrisaoPorId(model);
        if (responseBuscaMandadoDePrisaoPorId.statusCode != 200) {
          Loader.hide();
          Future.delayed(Duration(seconds: 1), () {
            SnackWidget.showSnackBar(context,
                "Erro - ${responseBuscaMandadoDePrisaoPorId.statusMessage}");
          });
        } else {
          Loader.hide();
          Future.delayed(Duration(seconds: 1), () {
            var model = MandadoPrisaoDetalhadoModels.fromJson(
                responseBuscaMandadoDePrisaoPorId.data);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    DetalhesMandadosDePrisaolUnicaConsultasView(
                  model: model,
                ),
              ),
            );
          });
        }
      } else {
        Loader.hide();
        Future.delayed(Duration(seconds: 1), () {
          SnackWidget.showSnackBar(context, "Sem conexão com a internet.");
        });
      }
    });
  }

  //#endregion
}
