class ReceitaLista {
  int? id;
  String? nome;
  String? modoDePreparo;
  String? rendimento;
  int? userId;
  String? createdAt;
  String? updatedAt;

  ReceitaLista(
      {this.id,
        this.nome,
        this.modoDePreparo,
        this.rendimento,
        this.userId,
        this.createdAt,
        this.updatedAt});

  ReceitaLista.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    modoDePreparo = json['modo_de_preparo'];
    rendimento = json['rendimento'];
    userId = json['UserId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['modo_de_preparo'] = this.modoDePreparo;
    data['rendimento'] = this.rendimento;
    data['UserId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
