// ignore_for_file: empty_catches

import 'package:cloud_firestore/cloud_firestore.dart';

class Temporal {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  Future<void> bsdTemporal(String user, String exercise, String name) async {
    
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
          'Nombre' : name,
        };

        await collection.add(dataToAdd);
      } 
    } catch (e) {
    }
  }
}
