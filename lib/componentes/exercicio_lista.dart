import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../models/exercicio.dart';
import '../providers/exerc_provider.dart';
import 'exercicio_lista_title.dart';

class ExercicioLista extends StatelessWidget {
  const ExercicioLista({super.key});

  @override
  Widget build(BuildContext context) {
    final exercProvider = context.watch<ExercProvider>();
    // final exercicios = exercProvider.exercicios;
    // final List<Exercicio> listaExerc = exercicios;
    final List<Exercicio> listaExerc = exercProvider.exercicios;



    if (listaExerc.isEmpty){
      exercProvider.list();
    }

    return ListView.builder(
      itemCount: listaExerc.length, // diz quantos itens tem na lista
      itemBuilder: (context, index) {
        // Item Builder indica como vai renderizar os itens (contex indica o contexto e o index indica o index (item 1 para começar (startar a aplicação) e ambos precisam de um return
        Exercicio exerc = listaExerc[index];
        return ExercicioListaTile(exerc);
      },
    );
  }
}
