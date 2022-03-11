class Filiacao {
  String nomeFiliacao;
  String descricaoFiliacao;

  Filiacao({this.nomeFiliacao, this.descricaoFiliacao});

  Filiacao.fromJson(Map<String, dynamic> json) {
    nomeFiliacao = json['nomeFiliacao'];
    descricaoFiliacao = json['descricaoFiliacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nomeFiliacao'] = this.nomeFiliacao;
    data['descricaoFiliacao'] = this.descricaoFiliacao;
    return data;
  }
}