class Exercicio {
  String? id;
  String nomeExercicio;
  String repeticoes;
  int peso;

  Exercicio(
    this.nomeExercicio,
    this.repeticoes,
    this.peso,
  );


  static Exercicio fromMap(String id, Map<String, dynamic> map) {

    var exerc = Exercicio(
      map['nomeExercicio'],
      map['repeticoes'],
      map['peso'],
    );
    exerc.id = id;
    return exerc;
  }
}
