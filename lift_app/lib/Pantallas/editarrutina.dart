import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';

class Editar extends StatelessWidget {
  Editar({Key? key}) : super(key: key);
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final user = arguments['user'];
    final name = arguments['name'];
    final workouts = firestore.collection('Workouts').snapshots();
    
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Row(
          children: [
            Icon(Icons.fitness_center, size: 38,),
            Text('  '),
            Text(
              'Opciones disponibles',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, MyRoutes.ejercicios.name, arguments: {'user': user, 'name': name});
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: workouts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final workoutlist = snapshot.data!.docs;

            return ListView.builder(
              itemCount: workoutlist.length,
              itemBuilder: (context, index) {
                final wk = workoutlist[index];
                final List<dynamic> todos = wk['Rutinas'];

                return Column(
                  children: todos.map((rutina) {
                    return ListTile(
                      title: Text(
                        rutina.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        // Implementa la lógica cuando se hace clic en una rutina
                      },
                      trailing: const Icon(Icons.add_circle_outline_sharp, color: Colors.redAccent),
                    );
                  }).toList(),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      
    );
  }
}
