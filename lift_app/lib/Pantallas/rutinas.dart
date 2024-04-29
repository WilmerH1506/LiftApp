// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';



class RutinasPage extends StatelessWidget {
   RutinasPage({Key? key}) : super(key: key);
          FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
      final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;    
        final user = arguments['user'];
        final workouts = firestore.collection('Rutina Final').where('usuario', isEqualTo: user).snapshots();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: 
        
      const Row(
        children: [
         Icon(Icons.fitness_center,size: 38,),
         Text('  '),
         Text('Mis Rutinas', style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold
         ),)
        ],
       ),
       actions: [
        IconButton(onPressed: () {
        Navigator.pushReplacementNamed(context, MyRoutes.inicio.name, arguments: user);
                                   

        },
        icon: const Icon(Icons.logout),)
       ],
        
        
      ),
      body:StreamBuilder<QuerySnapshot>(
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
                    
                    title: Text(wk['name'],style:const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),),
                    
                    trailing: GestureDetector(
                      onTap: () { 

            Navigator.pushReplacementNamed(context, MyRoutes.ejercicios.name, arguments: {'user': user, 'name': wk['name']});

                      },
                      child:const Column(
                        children: [
                          Icon(Icons.arrow_upward_outlined, color: Colors.redAccent),
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
