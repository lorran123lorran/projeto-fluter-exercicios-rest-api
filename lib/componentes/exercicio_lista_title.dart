import 'package:flutter/material.dart';
import '../models/exercicio.dart';
import '../routes.dart';

class ExercicioListaTile extends StatelessWidget {
  const ExercicioListaTile(this.exerc, {super.key});

  final Exercicio exerc;

  @override
  Widget build(BuildContext context) {
    String nomeExercicio = exerc.nomeExercicio;
    String repeticoes = exerc.repeticoes;
    int peso = exerc.peso;

    return Container(
      color: Colors.blue,
      padding: const EdgeInsets.all(7),
      child: Card(
        child: ListTile(
          leading: Text("$peso kg"),
          title: Text(nomeExercicio),
          subtitle: Text(repeticoes),
          trailing: Switch.adaptive(
            value: false,
            onChanged: (val) {},
          ),
          onTap: () {
            Navigator.pushNamed(context, Routes.DETAILS, arguments: exerc);
          },
        ),
      ),
    );
  }
}
