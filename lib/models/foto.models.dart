class Foto {
  String dataFoto;
  bool flgFotoPrincipal;
  String foto;
  String origemFoto;
  String tipoConteudoFoto;

  Foto(
      {this.dataFoto,
      this.flgFotoPrincipal,
      this.foto,
      this.origemFoto,
      this.tipoConteudoFoto});

  Foto.fromJson(Map<String, dynamic> json) {
    dataFoto = json['dataFoto'];
    flgFotoPrincipal = json['flgFotoPrincipal'];
    foto = json['foto'];
    origemFoto = json['origemFoto'];
    tipoConteudoFoto = json['tipoConteudoFoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dataFoto'] = this.dataFoto;
    data['flgFotoPrincipal'] = this.flgFotoPrincipal;
    data['foto'] = this.foto;
    data['origemFoto'] = this.origemFoto;
    data['tipoConteudoFoto'] = this.tipoConteudoFoto;
    return data;
  }
}
