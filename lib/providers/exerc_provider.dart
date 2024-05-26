import 'package:flutter/cupertino.dart';
import '../models/exercicio.dart';

class ExercProvider extends ChangeNotifier {
  List<Exercicio>? exercicios = [];

  void addExerc(Exercicio exerc) {
    exercicios?.add(exerc);
    notifyListeners();
  }

  void deleteExerc(Exercicio exerc) {
    exercicios?.remove(exerc);
    notifyListeners();
  }
}
