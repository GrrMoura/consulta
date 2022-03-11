import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:consulta_integrada/models/dispositivo.models.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';

class DispositivoServices {
  static Future<bool> verificarConexao() async {
    var result = await Connectivity()
        .checkConnectivity(); //TODO: atualizar o connectivity e device_info tambem
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) return true;
    return false;
  }

//TODO: CRIAR HISTORICO DE PESQUISA
  static Future<DispositivoModels> carregarInformacoesDispositivo() async {
    final DeviceInfoPlugin dispositivoInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        return _readAndroidBuildData(await dispositivoInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        return _readIosDeviceInfo(await dispositivoInfoPlugin.iosInfo);
      }
    } on PlatformException {
      return null;
    }
    return null;
  }

  static DispositivoModels _readAndroidBuildData(AndroidDeviceInfo build) {
    var dispositivo = new DispositivoModels(
        idDispositivo: build.androidId,
        fabricante: build.manufacturer,
        modelo: build.model,
        so: "Android",
        versaoSo: build.version.release);
    return dispositivo;
  }

  static DispositivoModels _readIosDeviceInfo(IosDeviceInfo data) {
    // TODO - validar informações rodando em iOS
    var dispositivo = new DispositivoModels(
        idDispositivo: data.identifierForVendor,
        fabricante: "Apple",
        modelo: data.model,
        so: data.systemName,
        versaoSo: data.systemVersion);
    return dispositivo;
  }
}
