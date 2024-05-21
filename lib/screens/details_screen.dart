import 'package:flutter/material.dart';
import '../models/exercicio.dart';
import '../routes.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Exercicio exerc = ModalRoute.of(context)!.settings.arguments as Exercicio;

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
                    Navigator.pushNamed(context, Routes.FORM);
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
                    Navigator.pushNamed(context, Routes.FORM);
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
