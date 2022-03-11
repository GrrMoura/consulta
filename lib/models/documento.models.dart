class Documento {
  String numeroDocumento;
  String tipoDocumento;
  String fotoDocumento;
  String tipoConteudoFoto;
  String outrosNomes;
  String textoOrgaoEmissor;
  String uf;

  Documento(
      {this.numeroDocumento,
        this.tipoDocumento,
        this.fotoDocumento,
        this.tipoConteudoFoto,
        this.outrosNomes,
        this.textoOrgaoEmissor,
        this.uf});

  Documento.fromJson(Map<String, dynamic> json) {
    numeroDocumento = json['numeroDocumento'];
    tipoDocumento = json['tipoDocumento'];
    fotoDocumento = json['fotoDocumento'];
    tipoConteudoFoto = json['tipoConteudoFoto'];
    outrosNomes = json['outrosNomes'];
    textoOrgaoEmissor = json['textoOrgaoEmissor'];
    uf = json['uf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numeroDocumento'] = this.numeroDocumento;
    data['tipoDocumento'] = this.tipoDocumento;
    data['fotoDocumento'] = this.fotoDocumento;
    data['tipoConteudoFoto'] = this.tipoConteudoFoto;
    data['outrosNomes'] = this.outrosNomes;
    data['textoOrgaoEmissor'] = this.textoOrgaoEmissor;
    data['uf'] = this.uf;
    return data;
  }
}