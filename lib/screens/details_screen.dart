import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/exercicio.dart';
import '../providers/exerc_provider.dart';
import '../routes.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Exercicio exerc = ModalRoute.of(context)!.settings.arguments as Exercicio;

    final exercProvider = context.watch<ExercProvider>();

    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text(
          'Detalhe do Exercício',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context, "21:51:15");
            },
            icon: const Icon(Icons.home),
            color: Colors.white,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              exerc.nomeExercicio,
              style: const TextStyle(fontSize: 28, color: Colors.indigo),
            ),
            Text(
              exerc.repeticoes,
              style: const TextStyle(fontSize: 20, color: Colors.indigo),
            ),
            Text(
              exerc.peso.toString(),
              style: const TextStyle(fontSize: 20, color: Colors.indigo),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  padding: EdgeInsets.all(50),
                  onPressed: () {
                    exercProvider.deleteExerc(exerc);

                    Navigator.pushNamed(context, Routes.SERIEA);
                  },
                  icon: const Icon(
                    Icons.delete,
                    size: 35,
                  ),
                  color: Colors.red,
                ),
                IconButton(
                  padding: EdgeInsets.all(50),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, Routes.EDITAR,
                        arguments: exerc);
                  },
                  icon: const Icon(
                    Icons.edit,
                    size: 40,
                  ),
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
