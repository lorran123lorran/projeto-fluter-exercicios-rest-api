import 'package:flutter/material.dart';
import '../componentes/exercicio_lista.dart';
import '../routes.dart';

class SerieA extends StatefulWidget {
  const SerieA({super.key});

  @override
  State<SerieA> createState() => _SerieAState();
}

class _SerieAState extends State<SerieA> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text("Série A"),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 25),
        actions: [
          IconButton(onPressed: (){
          Navigator.pushNamed(context, Routes.CATALOG);
          }, icon: const Icon(Icons.home, color: Colors.white, size: 25,),),
          IconButton(onPressed: (){
            Navigator.pushNamed(context, Routes.FORM);
          }, icon: const Icon(Icons.add_circle, color: Colors.white, size: 25,))
        ],
      ),
      body: const ExercicioLista(),
      drawer: Drawer(
        backgroundColor: Colors.lightBlue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: const Icon(
                Icons.fitness_center,
                color: Colors.white,
                size: 30,
              ),
              title: const Text(
                "Crie a Série A",
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              trailing: const Icon(Icons.double_arrow_rounded,
                  color: Colors.white, size: 35),
              onTap: () {
                Navigator.pushNamed(context, Routes.FORM);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.adjust,
                color: Colors.white,
                size: 30,
              ),
              title: const Text(
                "Série A",
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              trailing: const Icon(
                Icons.double_arrow_rounded,
                color: Colors.white,
                size: 35,
              ),
              onTap: () {
                Navigator.pushNamed(context, Routes.SERIEA);
              },
            ),
          ],
        ),
      ),
    );
  }
}
