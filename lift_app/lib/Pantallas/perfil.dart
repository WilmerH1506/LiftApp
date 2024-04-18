import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return Scaffold(
      backgroundColor: Colors.black,
    appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: StreamBuilder<QuerySnapshot>(
          stream: firestore.collection('Usuarios').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('Cargando...');
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            // Extraer datos del snapshot
            final datos = snapshot.data!.docs;
            // Por ejemplo, asumimos que solo hay un documento y que contiene un campo 'usuario'
            final usuario = datos.isNotEmpty ? datos[0]['usuario'] : '';
            return Text(usuario,style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),);
          },
        ),
      ),
      body: Center(
        child: Text('Contenido de la página de perfil', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
