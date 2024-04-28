import 'package:cloud_firestore/cloud_firestore.dart';

class Temporal {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Método para agregar datos a Firestore con validación
  Future<void> bsdTemporal(String user, String exercise) async {
    // Definir la colección 'RutinaTemporal'
    final collection = _firestore.collection('RutinaTemporal');

    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await collection
          .where('Usuario', isEqualTo: user)
          .where('Ejercicio', isEqualTo: exercise)
          .get();

      if (querySnapshot.docs.isEmpty)
       {
        Map<String, dynamic> dataToAdd = {
          'Usuario': user,
          'Ejercicio': exercise,
        };

        await collection.add(dataToAdd);
      } 
    } catch (e) {
      print('Error al agregar datos a Firestore: $e');
    }
  }
}
