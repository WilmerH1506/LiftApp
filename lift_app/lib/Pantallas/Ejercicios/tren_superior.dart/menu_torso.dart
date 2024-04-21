import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Widgets/board.dart';

class MenuTorso extends StatelessWidget {
  const MenuTorso({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
        final  user = ModalRoute.of(context)!.settings.arguments as String;

    return  Scaffold(
    appBar: AppBar(
          title: const Row(
            children: [
               Text('Menu Tren Superior',style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),),
          Icon(Icons.sports_gymnastics_sharp)
            ],
          ),
          backgroundColor: Colors.redAccent,
          actions: [IconButton(onPressed: () {
            Navigator.pushReplacementNamed(context, MyRoutes.crear_rutinas.name,arguments: user);
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
              titulo: "Triceps",
               ontap: (){
                Navigator.pushReplacementNamed(context, MyRoutes.menu_superior.name,arguments: user);
               },),
           const  Padding(
              padding:  EdgeInsets.only(top: 20),
            ),
            Board(
               titulo: "Pecho",
                ontap: (){
                  Navigator.pushReplacementNamed(context, MyRoutes.menu_pecho.name , arguments: user);
                }
               ),
            const Padding(padding:  EdgeInsets.only(top: 20),
            ),
            Board(
            titulo: "Biceps",
            ontap: (){
            Navigator.pushReplacementNamed(context, MyRoutes.menu_biceps.name , arguments: user);

            }
            ),
            const Padding(padding:  EdgeInsets.only(top: 20),
            ),
            Board(
              titulo: "Hombro",
              ontap: (){
              Navigator.pushReplacementNamed(context, MyRoutes.menu_hombros.name , arguments: user);
              }
              ),
                           
          ],
        ),
      ),
    );
  }
}

