import 'package:flutter/cupertino.dart';
import '../models/exercicio.dart';

class ExercProvider extends ChangeNotifier {
  List<Exercicio>? exercicios = [
    Exercicio("Voador Peitoral", "3 x 15 repetições", 30),
    Exercicio("Remada Apaiada", "3 x 15 repetições", 25),
    Exercicio("Supino Reto", "3 x 12 repetições", 50),
    Exercicio("Elevação Ombros", "3 x 12 repetições", 20),
    Exercicio("Rosca Biceps Alternado", "3 x 1 repetições", 30),
    Exercicio("Abdominado Cadeira", "4 x 30 repetições", 12),
    Exercicio("Triceps Corda", "3 x 12 repetições", 20),
  ];

  void addExerc(Exercicio exerc) {
    exercicios?.add(exerc);
    notifyListeners();
  }

  // não consegui implementar o restante de editar e excluir :(

  void deleteExerc(Exercicio exerc) {
    exercicios?.remove(exerc);
    notifyListeners();
  }
}
