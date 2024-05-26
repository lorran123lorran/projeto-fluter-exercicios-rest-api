import 'package:flutter/cupertino.dart';
import '../models/exercicio.dart';

class ExercProvider extends ChangeNotifier {
  List<Exercicio>? exercicios = [
    Exercicio ("Voador Peitoral", "3 x 12 repetições", 30),
    Exercicio ("Supino Reto", "3 x 10 repetições", 50),
    Exercicio ("Biceps Corda", "3 x 10 repetições", 20),
    Exercicio ("Rosca Biceps Alternada", "3 x 10 repetições", 50),
    Exercicio ("Remada Apoiada", "3 x 10 repetições", 70),
  ];

  void addExerc(Exercicio exerc) {
    exercicios?.add(exerc);
    notifyListeners();
  }

  void deleteExerc(Exercicio exerc) {
    exercicios?.remove(exerc);
    notifyListeners();
  }
}
