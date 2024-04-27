import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Widgets/board.dart';

class TrenSuperior extends StatelessWidget {
  const TrenSuperior({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
        final  user = ModalRoute.of(context)!.settings.arguments as String;

    return  Scaffold(
    appBar: AppBar(
          title: const Row(
            children: [
               Text('Menu Triceps',style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),),
          Icon(Icons.sports_gymnastics_sharp)
            ],
          ),
          backgroundColor: Colors.redAccent,
          actions: [IconButton(onPressed: () {
            Navigator.pushReplacementNamed(context, MyRoutes.menu_torso.name,arguments: user);
          },
          icon: const Icon(Icons.logout),
          )],
        ),
      backgroundColor: Colors.black,
      body:  SingleChildScrollView(
        child: Column(
          children:[
           const Padding(
              padding:  EdgeInsets.only(top: 20),
            ),
            Board(
              titulo: "Fondos",
               ontap: (){
                Navigator.pushReplacementNamed(context, MyRoutes.fondos.name,arguments: user);
               },
               imagen: Image.asset('Assets/Fondos.png'),
               ),
           const  Padding(
              padding:  EdgeInsets.only(top: 20),
            ),
            Board(
               titulo: "Extension con Polea",
                ontap: (){
                  Navigator.pushReplacementNamed(context, MyRoutes.extension_polea.name , arguments: user);
                },
                imagen: Image.asset('Assets/Polea.png'),
               ),
            const Padding(padding:  EdgeInsets.only(top: 20),
            ),
            Board(
            titulo: "Extension con Barra",
            ontap: (){
            Navigator.pushReplacementNamed(context, MyRoutes.extension_barra.name , arguments: user);
            },
            imagen: Image.asset('Assets/Barra.png'),
            ),
            const Padding(padding:  EdgeInsets.only(top: 20),
            ),
            Board(
              titulo: "Press Frances",
              ontap: (){
              Navigator.pushReplacementNamed(context, MyRoutes.press_frances.name , arguments: user);
              },
              imagen: Image.asset('Assets/Frances.png'),
              ),
              const Padding(padding:  EdgeInsets.only(top: 20),
            ),
            Board(
              titulo: "Extension Sobre Cabeza",
              ontap: (){
              Navigator.pushReplacementNamed(context, MyRoutes.sobrecabeza.name , arguments: user);
              },
              imagen: Image.asset('Assets/SobreC.png'),
              ),
              
          ],
        ),
      ),
    );
  }
}

