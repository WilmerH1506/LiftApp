import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Final {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    Future<void> subirRutina(BuildContext context, String usuario, List<String> ejercicios,String name) async {
        if (usuario.isEmpty || ejercicios.isEmpty || name.isEmpty ) {
            showDialog(
                context: context,
                builder: (context) {
                    return AlertDialog(
                        title: const Text('Advertencia'),
                        content: const Text('No se agregaran rutinas vacias.'),
                        actions: [
                            TextButton(
                                onPressed: () {
                                    
                                },
                                child: const Text('Aceptar'),
                            ),
                        ],
                    );
                },
            );
            return; 
        }

        Map<String, dynamic> datos = {
            'usuario': usuario,
            'ejercicios': ejercicios,
            'name': name,
        };

        await _firestore.collection('Rutina Final').add(datos);

        // ignore: use_build_context_synchronously
        showDialog(
            context: context,
            builder: (context) {
                return AlertDialog(
                    title: const Text('Éxito'),
                    content: const Text('Los rutina fue guardada.'),
                    actions: [
                        TextButton(
                            onPressed: () {
                                Navigator.of(context).pop();
                            },
                            child: const Text('Aceptar'),
                        ),
                    ],
                );
            },
        );
    }
}
