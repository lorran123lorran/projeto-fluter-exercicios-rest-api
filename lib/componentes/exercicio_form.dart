import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';
import 'package:projetoacademia/routes.dart';
import 'package:provider/provider.dart';
import '../models/exercicio.dart';
import '../providers/exerc_provider.dart';


class ExercicioForm extends StatelessWidget {
  ExercicioForm({super.key});

  final nomeExercicioController = TextEditingController();
  final repeticoesController = TextEditingController();
  final pesoController = TextEditingController();

  Future<LocationData?> getLocation() async {
    Location location = Location();
    bool serviceEnable;
    PermissionStatus permissionStatus;

    serviceEnable = await location.serviceEnabled();
    if (!serviceEnable) {
      serviceEnable = await location.requestService();
      if (!serviceEnable) {
        Fluttertoast.showToast(
            msg: "Permissão necessária para prosseguir!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blueAccent,
            textColor: Colors.white,
            fontSize: 16.0);
        return null;
      }
    }

    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        Fluttertoast.showToast(
            msg: "Permissão necessária para prosseguir!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blueAccent,
            textColor: Colors.white,
            fontSize: 16.0);
        return null;
      }
    }
    return location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    final exercProvider = context.watch<ExercProvider>();
    final insert = exercProvider.insert;
    // final addExerc = exercProvider.addExerc;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                textAlign: TextAlign.center,
                controller: nomeExercicioController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8.0),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                textAlign: TextAlign.center,
                controller: repeticoesController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8.0),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                textAlign: TextAlign.center,
                controller: pesoController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8.0),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    String nomeExercicio = nomeExercicioController.text;
                    String repedicoes = repeticoesController.text;
                    int peso = int.parse(pesoController.text);

                    final exerc = Exercicio(nomeExercicio, repedicoes, peso);

                    exercProvider.exercicios.clear;
                    insert(exerc);

                    Fluttertoast.showToast(
                        msg: "Exercício adicionado com sucesso!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.blueAccent,
                        textColor: Colors.white,
                        fontSize: 16.0);

                    Navigator.pushNamed(context, Routes.SERIEA);
                  },
                  child: const Text(
                    "Adicionar ",
                    style: TextStyle(fontSize: 22, color: Colors.indigoAccent),
                  ),
                ),
              ),
            ),
            FutureBuilder(
              future: getLocation(),
              builder: (context, snapshot) {
                return Text (
                  '${snapshot.data?.latitude} ${snapshot.data?.longitude}',
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
