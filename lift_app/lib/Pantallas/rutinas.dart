import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';

class RutinasPage extends StatelessWidget {
  const RutinasPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
      final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      
        final user = arguments['user'];
        final name = arguments['name'];

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
           Navigator.pushReplacementNamed(context, MyRoutes.inicio.name, arguments: {
                                                'user': user,
                                                'name': name,
                                            });
        },
        icon: const Icon(Icons.logout),)
       ],
        
        
      ),
      body:const  Center(
        child:  Text('rutinas', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
