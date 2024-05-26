import 'package:flutter/material.dart';
import '../componentes/exercicio_form_edit.dart';

class FormScreenEdit extends StatelessWidget {
  const FormScreenEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alterar sua Série'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ExercicioFormEdit(),
        ],
      ),
    );
  }
}
