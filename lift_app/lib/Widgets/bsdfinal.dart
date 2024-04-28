import 'package:cloud_firestore/cloud_firestore.dart';

class Final {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> subirRutina(String usuario, List<String> ejercicios) async {

    Map<String, dynamic> datos = 
    {
      'usuario': usuario,
      'ejercicios': ejercicios
    };

    await _firestore.collection('Rutina Final').add(datos);
  }
}
