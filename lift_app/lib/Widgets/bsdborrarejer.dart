// ignore_for_file: empty_catches

import 'package:cloud_firestore/cloud_firestore.dart';

class BorrarEjer {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> borrar(String user, String ejer) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection('RutinaTemporal')
          .where('Usuario', isEqualTo: user) 
          .where('Ejercicio', isEqualTo: ejer)
          .get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> doc in querySnapshot.docs) 
      {
        await doc.reference.delete(); 
      }

    } catch (e) {
     
    }
  }
}