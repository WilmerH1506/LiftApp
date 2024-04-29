import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
            Icon(Icons.fitness_center, size: 38),
            SizedBox(width: 10),
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
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: workouts,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final workoutList = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: workoutList.length,
                    itemBuilder: (context, index) {
                      final wk = workoutList[index];
                      final List<dynamic> ejercicios = wk['ejercicios'];
                      return Column(
                        children: ejercicios.map((ejercicio) {
                          return Dismissible(
                            key: Key(ejercicio.toString()),
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
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () {
                                    
                                    if (ejercicio.toString() == 'Abdominales')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.abdominales.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                    else if (ejercicio.toString() == 'Antebrazo')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.antebrazo.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                    else if (ejercicio.toString() == 'Curl de Biceps')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.curl.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                    else if (ejercicio.toString() == 'Curl Martillo')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.martillo.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                    else if (ejercicio.toString() == 'Predicador')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.predicador.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                    else if (ejercicio.toString() == 'Vuelos Laterales')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.laterales.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                    else if (ejercicio.toString() == 'Press Militar')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.press_militar.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                    else if (ejercicio.toString() == 'Pecho Inferior')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.pecho_inferior.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                    else if (ejercicio.toString() == 'Vuelos Posteriores')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.vuelos_posteriores.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                     else if (ejercicio.toString() == 'Pecho Plano')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.pecho_plano.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                    else if (ejercicio.toString() == 'Pecho Superior')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.pecho_superior.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                    else if (ejercicio.toString() == 'Extension polea')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.extension_polea.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                     else if (ejercicio.toString() == 'Extension con Barra')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.extension_barra.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                    else if (ejercicio.toString() == 'Fondos')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.fondos.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                    else if (ejercicio.toString() == 'Press Frances')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.press_frances.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                     else if (ejercicio.toString() == 'Extensiones sobre la cabeza')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.sobrecabeza.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                     else if (ejercicio.toString() == 'Face Pulls')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.face_pulls.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                     else if (ejercicio.toString() == 'Jalon Al Pecho')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.jalon_pecho.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                     else if (ejercicio.toString() == 'Pull Ups')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.pullups.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                     else if (ejercicio.toString() == 'Remos con mancuernas')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.remos_mancuerna.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                    else if (ejercicio.toString() == 'Remos con Barra')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.remos.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                     else if (ejercicio.toString() == 'Abductores')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.abductores.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                    else if (ejercicio.toString() == 'Bulgaras')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.bulgaras.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                    else if (ejercicio.toString() == 'Extensiones')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.extensiones.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                     else if (ejercicio.toString() == 'Prensa')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.prensa.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                    else if (ejercicio.toString() == 'Sentadilla')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.sentadilla.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                    else if (ejercicio.toString() == 'Zancadas')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.zancadas.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                    else if (ejercicio.toString() == 'Femoral Acostado')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.femoral_acostado.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                    else if (ejercicio.toString() == 'Femoral Sentado')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.femoral_sentado.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                    else if (ejercicio.toString() == 'Peso Muerto')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.pesomuerto.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                    else if (ejercicio.toString() == 'Hip thrust')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.hip_thrust.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                    else if (ejercicio.toString() == 'Patada con Polea')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.patada.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                     else if (ejercicio.toString() == 'Sentadilla Sumo')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.sumo.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                    else if (ejercicio.toString() == 'Pantorrillas Parado')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.elevaciones_parado.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }

                                    else if (ejercicio.toString() == 'Pantorrillas Sentado')
                                    {
                                      Navigator.pushReplacementNamed(context, MyRoutes.elevaciones_sentado.name,arguments: {'user': user, 'name': name, 'showAddButton': true} );
                                    }






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
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, MyRoutes.editar.name, arguments: {'user': user, 'name': name});
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(250, 50),
              ),
              child: const Text(
                'Agregar Rutina',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
