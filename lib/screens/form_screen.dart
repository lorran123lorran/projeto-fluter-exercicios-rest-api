import 'package:flutter/material.dart';
import '../componentes/exercicio_form.dart';


class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade700,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.blue.shade900,
              title: const Text('Cadastre sua Série', style: TextStyle(color: Colors.white),),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
    ExercicioForm(),
              ],
            ),
          );
  }
}
