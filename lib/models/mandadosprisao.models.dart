class MandadosPrisaoModels {
  String idPessoa;
  String nome;
  String alcunha;
  String nomePai;
  String nomeMae;
  String dataNascimento;
  String sexo;
  String naturalidade;
  String statusPessoa;
  String indiceAssertividade;

  MandadosPrisaoModels(
      {this.idPessoa,
      this.nome,
      this.alcunha,
      this.nomePai,
      this.nomeMae,
      this.dataNascimento,
      this.sexo,
      this.naturalidade,
      this.statusPessoa,
      this.indiceAssertividade});

  MandadosPrisaoModels.fromJson(Map<String, dynamic> json) {
    idPessoa = json['idPessoa'];
    nome = json['nome'];
    alcunha = json['alcunha'];
    nomePai = json['nomePai'];
    nomeMae = json['nomeMae'];
    dataNascimento = json['dataNascimento'];
    sexo = json['sexo'];
    naturalidade = json['naturalidade'];
    statusPessoa = json['statusPessoa'];
    indiceAssertividade = json['indiceAssertividade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idPessoa'] = this.idPessoa;
    data['nome'] = this.nome;
    data['alcunha'] = this.alcunha;
    data['nomePai'] = this.nomePai;
    data['nomeMae'] = this.nomeMae;
    data['dataNascimento'] = this.dataNascimento;
    data['sexo'] = this.sexo;
    data['naturalidade'] = this.naturalidade;
    data['statusPessoa'] = this.statusPessoa;
    data['indiceAssertividade'] = this.indiceAssertividade;
    return data;
  }

  Map<String, dynamic> toJsonOnlyIdPessoa() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idPessoa'] = this.idPessoa;
    return data;
  }
}
