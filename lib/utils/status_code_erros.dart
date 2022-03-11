class CodigosDeEstado {
  static String mensagem;

  static String numeroDoStatusCode(int statusCode) {
    switch (statusCode) {
      case 422:
        return mensagem = "Confira os dados informados. Tente novamente... ";
        break;

      case 403:
        return mensagem =
            "Problema em nossos servidores.\nTente novamente mais tarde.";
        break;

      case 504:
        return mensagem = "Tempo limite de conexão com servidor esgotado";
        break;

      default:
        return mensagem = "Erro ao consultar API";
    }
  }
}
