import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Widgets/adddatebar.dart';
import 'package:lift_app/Widgets/addrutinesbar.dart';


class PerfilPage extends StatelessWidget {
  PerfilPage({Key? key}) : super(key: key);
  FirebaseFirestore instance = FirebaseFirestore.instance;
  
  @override
  Widget build(BuildContext context) {
    final  user = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
       title: Text(user,style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),),
          actions: [IconButton(
            onPressed: () {
            Navigator.pushReplacementNamed(context,MyRoutes.login.name);
            },
            icon: const Icon(Icons.logout),
            
          )],
       backgroundColor: Colors.redAccent,
      ),
    
      body: Column(
        children: [
          addRutinebar(context),
          addDatebar(),
          showAgenda(),
        ],
        )
        
      );
  }

  showAgenda(){
     final rutina = instance.collection('Rutinas').snapshots();
    return StreamBuilder(
      stream: rutina,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
              final listarutina = snapshot.data!.docs;

        return Expanded(
        child: ListView.builder(
          itemCount: listarutina.length,
          itemBuilder: (BuildContext context, int index) {
            final rutina = listarutina[index];
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
               child: SlideAnimation(
                child: FadeInAnimation(
                  child:GestureDetector(
                    onTap: () {
                      showBottomSheet(context , rutina);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(top: 20,left: 20,right: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                  
                      child: Column(
                        children: [
                        //  Text(rutina['date'],style: const TextStyle(
                        //    fontWeight: FontWeight.bold
                        //  ),),
                          Text(rutina['startTime']),
                          Text(rutina['endTime']),
                        //  Text(rutina['remind'].toString()),
                        ],
                      ),
                    ),
                  ) ,)
                   ,)
                   ) ;
          },
        )
      );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      },
    );
  }

  showBottomSheet(BuildContext context, rutina) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.24,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: 120,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[300],
                ),
                child: const Text('     Rutina Completa     '),
               
              ),
               const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[300],
                ),
                child: const Text('      Eliminar Rutina      '),
              ),
            ],
          ),
        );
      },
    );
  }
}


