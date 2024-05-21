import 'package:flutter/material.dart';
import '../componentes/exercicio_form.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastre sua Série'),
      ),
      body: ExercicioForm(),
    );
  }
}
