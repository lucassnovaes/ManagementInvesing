class AcaoModel {
  String? acao = "";
  String? valor = "";

  AcaoModel({this.acao, this.valor});

  Map<String, dynamic> toMap() {
    return {
      'acao': acao,
      'valor': valor,
    };
  }
}
