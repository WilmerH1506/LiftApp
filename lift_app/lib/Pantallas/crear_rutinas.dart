import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Widgets/board.dart';

class CrearRutinasPage extends StatelessWidget {
  const CrearRutinasPage({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
        final  user = ModalRoute.of(context)!.settings.arguments as String;

    return  Scaffold(
       appBar: AppBar(
          title: const Row(
            children: [
               Text('Crear Rutinas',style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),),
          Icon(Icons.sports_gymnastics_sharp)
            ],
          ),
          backgroundColor: Colors.redAccent,
         
        ),
      backgroundColor: Colors.black,
      body:  SingleChildScrollView(
        child: Column(
          children:[
           const Padding(
              padding:  EdgeInsets.only(top: 20),
            ),
            Board(
              titulo: "Tren Superior",
               ontap: (){
                Navigator.pushReplacementNamed(context, MyRoutes.menu_torso.name , arguments: user);

               },
               imagen: Image.asset('Assets/Superior.png'),
               ),
           const  Padding(
              padding:  EdgeInsets.only(top: 20),
            ),
            Board(
               titulo: "Abdominales",
                ontap: (){
                  Navigator.pushReplacementNamed(context, MyRoutes.abdominales.name , arguments: user);
                },
                imagen: Image.asset('Assets/Abs.png'),
               ),
            const Padding(padding:  EdgeInsets.only(top: 20),
            ),
            Board(
            titulo: "Tren inferior",
            ontap: (){
              Navigator.pushReplacementNamed(context, MyRoutes.menu_inferior.name,arguments: user);
            },
            imagen: Image.asset('Assets/Inferior.png'),
            ),
            const Padding(padding:  EdgeInsets.only(top: 20),
            ),
            Board(
              titulo: "Espalda",
              ontap: (){
              Navigator.pushReplacementNamed(context, MyRoutes.menu_espalda.name , arguments: user);
              },
              imagen: Image.asset('Assets/Espalda.png'),
              ),
              
          ],
        ),
      ),
    );
  }
}

