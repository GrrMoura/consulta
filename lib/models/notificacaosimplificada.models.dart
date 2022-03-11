class NotificacaoSimplificadaModels {
  int id;
  String titulo;
  String texto;

  NotificacaoSimplificadaModels({this.id, this.titulo, this.texto});

  NotificacaoSimplificadaModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    texto = json['texto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['texto'] = this.texto;
    return data;
  }
}