// ignore_for_file: non_constant_identifier_names

class ImeiConsultaViewModel {
  String IMEI = "";
  bool ocupado;

  ImeiConsultaViewModel({this.IMEI, this.ocupado = false});

  ImeiConsultaViewModel.fromJson(Map<String, dynamic> json) {
    IMEI = json['IMEI'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IMEI'] = this.IMEI.replaceAll("-", "");
    return data;
  }
}
