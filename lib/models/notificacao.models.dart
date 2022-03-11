class NotificacaoModels {
  int id;
  String titulo;
  String texto;
  String data;
  bool visualizada;

  NotificacaoModels({this.id, this.titulo, this.texto, this.data, this.visualizada});

  NotificacaoModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    texto = json['texto'];
    data = json['data'];
    visualizada = json['visualizada'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['texto'] = this.texto;
    data['data'] = this.data;
    data['visualizada'] = this.visualizada;
    return data;
  }

  Map<String, dynamic> toJsonOnlyId() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdNotificacao'] = this.id;
    return data;
  }

}
