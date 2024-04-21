import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Widgets/board.dart';

class MenuHombro extends StatelessWidget {
  const MenuHombro({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
        final  user = ModalRoute.of(context)!.settings.arguments as String;

    return  Scaffold(
    appBar: AppBar(
          title: const Row(
            children: [
               Text('Menu De Hombros',style: TextStyle(
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
              titulo: "Press Militar",
               ontap: (){
                Navigator.pushReplacementNamed(context, MyRoutes.press_militar.name,arguments: user);
               },),
           const  Padding(
              padding:  EdgeInsets.only(top: 20),
            ),
            Board(
               titulo: "Vuelos Laterales",
                ontap: (){
                  Navigator.pushReplacementNamed(context, MyRoutes.laterales.name , arguments: user);
                }
               ),
            const Padding(padding:  EdgeInsets.only(top: 20),
            ),
            Board(
            titulo: "Vuelos Posteriores",
            ontap: (){
            Navigator.pushReplacementNamed(context, MyRoutes.vuelos_posteriores.name , arguments: user);

            }
            ),
            
              
          ],
        ),
      ),
    );
  }
}

