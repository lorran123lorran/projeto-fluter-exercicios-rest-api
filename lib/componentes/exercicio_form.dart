import 'package:flutter/material.dart';
import 'package:projetoacademia/routes.dart';
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

    return Container(
      color: Colors.blue.shade700,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: nomeExercicioController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(20.0),
                          prefixIcon: Icon(
                            Icons.fitness_center,
                            color: Colors.white,
                          ),
                          label: Text(
                            "Nome do Exercício",
                          ),
                          labelStyle: TextStyle(color: Colors.white),
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: repeticoesController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(20.0),
                          prefixIcon: Icon(
                            Icons.data_usage_rounded,
                            color: Colors.white,
                          ),
                          label: Text("Quantas Repetições?"),
                          labelStyle: TextStyle(color: Colors.white),
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: pesoController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(20.0),
                          prefixIcon: Icon(
                            Icons.data_usage_rounded,
                            color: Colors.white,
                          ),
                          label: Text("Informe o Peso"),
                          labelStyle: TextStyle(color: Colors.white),
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          String nomeExercicio = nomeExercicioController.text;
                          String repedicoes = repeticoesController.text;
                          int peso = int.parse(pesoController.text);

                          final exerc =
                              Exercicio(nomeExercicio, repedicoes, peso);

                          addExerc(exerc);

                          Navigator.pushNamed(context, Routes.SERIEA);
                        },
                        child: const Text("Adicionar ",
                            style: TextStyle(
                                fontSize: 22, color: Colors.indigoAccent)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
