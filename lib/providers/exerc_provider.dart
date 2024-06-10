import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../models/exercicio.dart';

class ExercProvider extends ChangeNotifier {
    FirebaseFirestore db = FirebaseFirestore.instance;
    String collection = "exercicios";


  List<Exercicio> exercicios = [];

  // void addExerc(Exercicio exerc) {
  //   exercicios.add(exerc);
  //   notifyListeners();
  // }

  // void deleteExerc(Exercicio exerc) {
  //   exercicios.remove(exerc);
  //   notifyListeners();
  // }

    void insert (Exercicio exerc){
      var data = <String, dynamic>{
        'nomeExercicio': exerc.nomeExercicio,
        'repeticoes': exerc.repeticoes,
        'peso': exerc.peso,
      };


      // var future = db
      //     .collection(collection)
      //     .doc("exerc1")
      //     .set(data);

      var future = db.collection(collection).add(data);

      future.then((DocumentReference doc) {
        String id = doc.id;
        exerc.id = id;
        exercicios.add(exerc);
        notifyListeners();
      }
      );
    }

    void delete(Exercicio exerc) {
      var future = db.collection(collection).doc(exerc.id).delete();
      future.then((_){
        exercicios.remove(exerc);
        notifyListeners();
      },
      );
    }


  list () {

    db.collection(collection)
        .get()
        .then((QuerySnapshot qs) {
      exercicios.clear();
      for (var doc in qs.docs) {
        var exerc = doc.data() as Map<String, dynamic>;
        exercicios.add(Exercicio.fromMap(doc.id, exerc));
        notifyListeners();
      }
    }
   );
  }


}

