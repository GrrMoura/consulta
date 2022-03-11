class Cidadao {
  int id;
  String nome;
  String cpf;
  String rg;
  String dataNascimento;
  String idade;

  Cidadao(
      {this.id, this.nome, this.cpf, this.rg, this.dataNascimento, this.idade});

  Cidadao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    cpf = json['cpf'];
    rg = json['rg'];
    dataNascimento = json['dataNascimento'];
    idade = json['idade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['cpf'] = this.cpf;
    data['rg'] = this.rg;
    data['dataNascimento'] = this.dataNascimento;
    data['idade'] = this.idade;
    return data;
  }

  Map<String, dynamic> toJsonOnlyId() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
