import 'package:flutter/material.dart';

class RutinasPage extends StatelessWidget {
  const RutinasPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
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
       )
        
        
      ),
      body:const  Center(
        child:  Text('rutinas', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
