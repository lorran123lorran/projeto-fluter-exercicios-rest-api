import 'package:flutter/material.dart';
import '../models/exercicio.dart';
import '../routes.dart';

class ExercicioListaTile extends StatefulWidget {
  const ExercicioListaTile(this.exerc, {super.key});

  final Exercicio exerc;

  @override
  State<ExercicioListaTile> createState() => _ExercicioListaTileState();
}

class _ExercicioListaTileState extends State<ExercicioListaTile> {
  bool status = false;

  void itemSwitch(bool value) {
    setState(() {
      status = !status;
    });
  }

  @override
  Widget build(BuildContext context) {
    String nomeExercicio = widget.exerc.nomeExercicio;
    String repeticoes = widget.exerc.repeticoes;
    int peso = widget.exerc.peso;

    return Container(
      color: Colors.blue,
      padding: const EdgeInsets.all(7),
      child: Card(
        child: ListTile(
          leading: Text(
            "$peso kg",
            style: const TextStyle(color: Colors.red),
          ),
          title: Text(
            nomeExercicio,
            style: const TextStyle(color: Colors.red),
          ),
          subtitle: Text(repeticoes),
          trailing: Switch(
              value: status,
              onChanged: itemSwitch,
              inactiveTrackColor: Colors.redAccent.shade100,
              inactiveThumbColor: Colors.red,
              activeColor: Colors.green.shade600),
          onTap: () {
            Navigator.pushNamed(context, Routes.DETAILS,
                arguments: widget.exerc);
          },
        ),
      ),
    );
  }
}
