import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/exercicio.dart';
import '../providers/exerc_provider.dart';

class ExercicioForm extends StatelessWidget {
  ExercicioForm({super.key});

  final nomeExercicioController = TextEditingController();
  final repeticoesController = TextEditingController();
  final pesoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final exercProvider = context.watch<ExercProvider>();
    final addExerc = exercProvider.addExerc;

    return SizedBox(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(color: Colors.lightBlue),
        child: SizedBox(
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                TextField(
                  textAlign: TextAlign.center,
                  controller: nomeExercicioController,
                  decoration: const InputDecoration(
                      hintText: "Insira o nome do Exercício"),
                ),
                TextField(
                  textAlign: TextAlign.center,
                  controller: repeticoesController,
                  decoration:
                      const InputDecoration(hintText: "Quantas Repetições?"),
                ),
                TextField(
                  textAlign: TextAlign.center,
                  controller: pesoController,
                  decoration: const InputDecoration(hintText: "Informe o Peso"),
                ),
                Container(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        String nomeExercicio = nomeExercicioController.text;
                        String repedicoes = repeticoesController.text;
                        int peso = int.parse(pesoController.text);
                        final exerc =
                            Exercicio(nomeExercicio, repedicoes, peso);
                        addExerc(exerc);
                      },
                      child: const Text("Adicionar"),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
