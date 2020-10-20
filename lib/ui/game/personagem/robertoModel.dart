class ObjetoModel {
  double posx;
  double posy;
  double velocidade;
  String direcao;

  ObjetoModel({posx, posy});

  ObjetoModel.fromJson(Map<String, dynamic> json) {
    this.posx = json['posx'];
    this.posy = json['posy'];
    this.direcao = json['direcao'];
    this.velocidade = json['velocidade'];
  }
  @override
  String toString() {
    return "Roberto(posx: $posx, posy: $posy)";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['posx'] = this.posx;
    data['posy'] = this.posy;
    data['direcao'] = this.direcao;
    data['velocidade'] = this.velocidade;
    return data;
  }
}
