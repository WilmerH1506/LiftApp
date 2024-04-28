import 'package:cloud_firestore/cloud_firestore.dart';
class Descargar {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<String>> bsdescargar(String user) async {
    try {
  
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection('RutinaTemporal')
          .where('Usuario', isEqualTo: user) 
          .get();

      List<String> exercises = [];

      for (QueryDocumentSnapshot<Map<String, dynamic>> doc in querySnapshot.docs) {
        String? exercise = doc.data()['Ejercicio'];
        if (exercise != null) 
        {
          exercises.add(exercise);
        }
      }

      return exercises;

    } catch (e) {
      print('Error al recuperar ejercicios para el usuario $user: $e');
      return []; 
    }
  }
}

