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
        title: const Text('Crear Rutinas'),
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
               ontap: (){},),
           const  Padding(
              padding:  EdgeInsets.only(top: 20),
            ),
            Board(
               titulo: "Adominales",
                ontap: (){
                  Navigator.pushReplacementNamed(context, MyRoutes.abdominales.name , arguments: user);
                }
               ),
            const Padding(padding:  EdgeInsets.only(top: 20),
            ),
            Board(
            titulo: "Tren inferior",
            ontap: (){}
            ),
            const Padding(padding:  EdgeInsets.only(top: 20),
            ),
            Board(
              titulo: "Espalda",
              ontap: (){}
              )
          ],
        ),
      ),
    );
  }
}

