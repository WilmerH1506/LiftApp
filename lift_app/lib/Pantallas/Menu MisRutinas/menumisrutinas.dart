import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lift_app/Routes/my_routes.dart';

class Ejercicios extends StatelessWidget {
  Ejercicios({Key? key}) : super(key: key);
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final user = arguments['user'];
    final name = arguments['name'];
    final workouts = firestore.collection('Rutina Final').where('name', isEqualTo: name).snapshots();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Row(
          children: [
            Icon(Icons.fitness_center, size: 38,),
            Text('  '),
            Text('Listo?', style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),)
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, MyRoutes.rutinas.name, arguments: {'user': user, 'name': name});
            },
            icon: const Icon(Icons.logout),
          )
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
                final List<dynamic> ejercicios = wk['ejercicios'];

                return Column(
                  children: ejercicios.map((ejercicio) {
                    return Dismissible(
                      key: Key(ejercicio), // Usa el nombre del ejercicio como clave
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                     onDismissed: (direction) {
                                 wk.reference.update({
                                 'ejercicios': FieldValue.arrayRemove([ejercicio])
                                                                      });
                                                                        },
                      child: ListTile(
                        title: Text(
                          ejercicio.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        onTap: () {
                          // Aquí puedes implementar la lógica cuando se hace clic en un ejercicio
                          print(wk['ejercicios']);
                        },
                        trailing: const Icon(Icons.account_tree, color: Colors.redAccent),
                      ),
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Align(
          alignment: Alignment.bottomCenter,
      child: 
       ElevatedButton(
                            onPressed: () {   
               Navigator.pushReplacementNamed(context, MyRoutes.editar.name, arguments: {
                                                'user': user,
                                                'name': name,
                                            });                                          
                            },
                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        minimumSize: const Size(250, 50),
                                      ),
                              child: const Text(
                                        'Agreagr Rutina',
                                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                    ),
                                  )
        ),
      ),
    );
  }
}
