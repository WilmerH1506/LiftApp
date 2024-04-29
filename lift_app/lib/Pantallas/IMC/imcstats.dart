// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:lift_app/Routes/my_routes.dart';


class Estadisticas extends StatefulWidget {
  Estadisticas({Key? key}) : super(key: key);

  @override
  State<Estadisticas> createState() => _Estadisticas();
}

class _Estadisticas extends State<Estadisticas> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final user = arguments['user'];
    final workouts = firestore
        .collection('IMC')
        .where('name', isEqualTo: user)
        .snapshots();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Row(
          children: [
            Icon(
              Icons.fitness_center,
              size: 38,
            ),
            Text('  '),
            Text(
              'IMC',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, MyRoutes.inicio.name,
                  arguments: user);
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
                return Dismissible(
                  key: Key(wk.id),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    wk.reference.delete();
                  },
                  child: ListTile(
                    title: GestureDetector(
                      onTap: () {
                      
                      },
                      child: Text('IMC:' +
                        wk['imc'].toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),       
                    ),
                    subtitle: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                   const  SizedBox(height: 5,),
                        Text('Peso Corporal:'+
                        wk['Peso'].toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),  
                     const  SizedBox(height: 5,),
                      Text('Estatura:'+
                        wk['estatura'].toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                  const  SizedBox(height: 5,),

                      Text(
                        wk['Fecha'].toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),        
                      ],
                    ),
                          
                    trailing: GestureDetector(
                      onTap: () {
                       
                      },
                      child: const Column(
                        children: [
              
                           Icon(Icons.health_and_safety_rounded,
                              color: Colors.redAccent),
                          
                        ],
                      ),
                    ),
                  ),
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
