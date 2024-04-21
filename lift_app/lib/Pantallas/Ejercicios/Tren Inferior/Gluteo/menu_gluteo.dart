import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Widgets/board.dart';

class MenuGluteo extends StatelessWidget {
  const MenuGluteo({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
        final  user = ModalRoute.of(context)!.settings.arguments as String;

    return  Scaffold(
    appBar: AppBar(
          title: const Row(
            children: [
               Text('Menu De Gluteos',style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),),
          Icon(Icons.sports_gymnastics_sharp)
            ],
          ),
          backgroundColor: Colors.redAccent,
          actions: [IconButton(onPressed: () {
            Navigator.pushReplacementNamed(context, MyRoutes.menu_inferior.name,arguments: user);
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
              titulo: "Sentadilla Sumo",
               ontap: (){
                Navigator.pushReplacementNamed(context, MyRoutes.sumo.name,arguments: user);
               },),
           const  Padding(
              padding:  EdgeInsets.only(top: 20),
            ),
            Board(
               titulo: "Patada De Gluteo",
                ontap: (){
                  Navigator.pushReplacementNamed(context, MyRoutes.patada.name , arguments: user);
                }
               ),
            const Padding(padding:  EdgeInsets.only(top: 20),
            ),
            Board(
            titulo: "Hip Thrust",
            ontap: (){
            Navigator.pushReplacementNamed(context, MyRoutes.hip_thrust.name , arguments: user);

            }
            ),
            
              
          ],
        ),
      ),
    );
  }
}

