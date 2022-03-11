class SinaisMarcas {
  String descricaoOutros;
  String altura;
  String barba;
  String bigode;
  String boca;
  String biotipo;
  String tipoCabelo;
  String corOlhos;
  String formatoOlhos;
  String corPele;
  String labios;
  String nariz;
  String orelhas;
  String pescoco;
  String rosto;
  String sobrancelhas;
  String testa;

  SinaisMarcas(
      {this.descricaoOutros,
        this.altura,
        this.barba,
        this.bigode,
        this.boca,
        this.biotipo,
        this.tipoCabelo,
        this.corOlhos,
        this.formatoOlhos,
        this.corPele,
        this.labios,
        this.nariz,
        this.orelhas,
        this.pescoco,
        this.rosto,
        this.sobrancelhas,
        this.testa});

  SinaisMarcas.fromJson(Map<String, dynamic> json) {
    descricaoOutros = json['descricaoOutros'];
    altura = json['altura'];
    barba = json['barba'];
    bigode = json['bigode'];
    boca = json['boca'];
    biotipo = json['biotipo'];
    tipoCabelo = json['tipoCabelo'];
    corOlhos = json['corOlhos'];
    formatoOlhos = json['formatoOlhos'];
    corPele = json['corPele'];
    labios = json['labios'];
    nariz = json['nariz'];
    orelhas = json['orelhas'];
    pescoco = json['pescoco'];
    rosto = json['rosto'];
    sobrancelhas = json['sobrancelhas'];
    testa = json['testa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['descricaoOutros'] = this.descricaoOutros;
    data['altura'] = this.altura;
    data['barba'] = this.barba;
    data['bigode'] = this.bigode;
    data['boca'] = this.boca;
    data['biotipo'] = this.biotipo;
    data['tipoCabelo'] = this.tipoCabelo;
    data['corOlhos'] = this.corOlhos;
    data['formatoOlhos'] = this.formatoOlhos;
    data['corPele'] = this.corPele;
    data['labios'] = this.labios;
    data['nariz'] = this.nariz;
    data['orelhas'] = this.orelhas;
    data['pescoco'] = this.pescoco;
    data['rosto'] = this.rosto;
    data['sobrancelhas'] = this.sobrancelhas;
    data['testa'] = this.testa;
    return data;
  }
}