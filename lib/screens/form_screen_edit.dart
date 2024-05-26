import 'package:flutter/material.dart';
import '../componentes/exercicio_form_edit.dart';

class FormScreenEdit extends StatelessWidget {
  const FormScreenEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        backgroundColor: Colors.blue,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: const Text('Alterar sua Série', style: TextStyle(color: Colors.white),),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ExercicioFormEdit(),
            ],
          ),
        ),
      ),
    );
  }
}
