import 'package:consulta_integrada/services/autenticacao.services.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert' as convert;

class RequestsHttpServices {
  static Future<Response> postHeader(
      String url, Map<String, dynamic> data) async {
    try {
      var header = await AutenticacaoService.getHeader();
      var bodyJson = convert.jsonEncode(data);
      var response =
          await http.post(Uri.parse(url), body: bodyJson, headers: header);
      return response;
    } catch (e) {
      return null;
    }
  }
}
