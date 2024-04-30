// ignore_for_file: non_constant_identifier_names, empty_catches

import 'package:cloud_firestore/cloud_firestore.dart';

class Borrar {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> BorrarEjers(String user) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection('RutinaTemporal')
          .where('Usuario', isEqualTo: user) 
          .get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> doc in querySnapshot.docs) 
      {
        await doc.reference.delete(); 
      }

    } catch (e) {
      
    }
  }
}