class ConsultaUnicaViewModel {
  String nome;
  String rg;
  String cpf;
  String alcunha;
  String nomePai;
  String nomeMae;
  String dataNascimento;

  ConsultaUnicaViewModel(
      {this.nome,
        this.rg,
        this.cpf,
        this.alcunha,
        this.nomePai,
        this.nomeMae,
        this.dataNascimento});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['rg'] = this.rg;
    data['cpf'] = this.cpf;
    data['alcunha'] = this.alcunha;
    data['nomePai'] = this.nomePai;
    data['nomeMae'] = this.nomeMae;
    data['dataNascimento'] = this.dataNascimento;
    return data;
  }
}
