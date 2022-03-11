class LoginViewModel {
  String login;
  String senha;
  bool lembrarMe;
  bool leitorBiometrico;
  bool checkado;
  bool ocupado;

  LoginViewModel(
      {this.login,
      this.senha,
      this.lembrarMe = false,
      this.leitorBiometrico = false,
      this.checkado = false,
      this.ocupado = false});

  LoginViewModel.fromJson(Map<String, dynamic> json) {
    login = json['usuario'];
    senha = json['senha'];
    checkado = json['checkado'];
    lembrarMe = json['lembrarMe'];
    leitorBiometrico = json['leitorBiometrico'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['senha'] = this.senha;
    return data;
  }
}
