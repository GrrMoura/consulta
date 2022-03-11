class PaginacaoModels {
  int limite;
  int pagina;
  int totalPaginas;
  int registros;

  PaginacaoModels(
      {this.limite, this.pagina, this.totalPaginas, this.registros});

  PaginacaoModels.fromJson(Map<String, dynamic> json) {
    limite = 20; //json['limite']; //TODO: enviar uma paginação de forma correta
    pagina = json['pagina'];
    totalPaginas = json['totalPaginas'];
    registros = json['registros'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limite'] = this.limite;
    data['pagina'] = this.pagina;
    data['totalPaginas'] = this.totalPaginas;
    data['Registros'] = this.registros;
    return data;
  }

  int getPosicaoInicialList() {
    return (this.pagina * this.limite) - this.limite;
  }

  bool seChegouAoFinalDaPagina() {
    return this.pagina == totalPaginas;
  }

  void setProximaPagina() {
    this.pagina++;
  }
}
