class ReceitaSolo {
  String? nome;
  String? ingredientes;
  String? rendimento;
  String? descricao;

  ReceitaSolo({this.nome, this.ingredientes, this.rendimento, this.descricao});

  ReceitaSolo.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    ingredientes = json['ingredientes'];
    rendimento = json['rendimento'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['ingredientes'] = this.ingredientes;
    data['rendimento'] = this.rendimento;
    data['descricao'] = this.descricao;
    return data;
  }
}