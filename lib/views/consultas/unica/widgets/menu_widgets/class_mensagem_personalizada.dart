class MensagemPersonalizada {
  String mensagemPersonalizada(int quantidade) {
    if (quantidade != null) {
      switch (quantidade) {
        case 0:
          return "Não foram encontradas pessoas";
        case 1:
          return "Foi encontrada 1 pessoa";
        default:
          return "Foram encontradas $quantidade pessoas";
      }
    }
    return "Não foram encontradas pessoas";
  }
}
