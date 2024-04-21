import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Widgets/board.dart';

class MenuBiceps extends StatelessWidget {
  const MenuBiceps({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
        final  user = ModalRoute.of(context)!.settings.arguments as String;

    return  Scaffold(
    appBar: AppBar(
          title: const Row(
            children: [
               Text('Menu De Biceps',style: TextStyle(
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
              titulo: "Curl De Biceps",
               ontap: (){
                Navigator.pushReplacementNamed(context, MyRoutes.curl.name,arguments: user);
               },),
           const  Padding(
              padding:  EdgeInsets.only(top: 20),
            ),
            Board(
               titulo: "Predicador",
                ontap: (){
                  Navigator.pushReplacementNamed(context, MyRoutes.predicador.name , arguments: user);
                }
               ),
            const Padding(padding:  EdgeInsets.only(top: 20),
            ),
            Board(
            titulo: "Martillo",
            ontap: (){
            Navigator.pushReplacementNamed(context, MyRoutes.martillo.name , arguments: user);

            }
            ),
            const Padding(padding:  EdgeInsets.only(top: 20),
            ),
            Board(
            titulo: "Antebrazo",
            ontap: (){
            Navigator.pushReplacementNamed(context, MyRoutes.antebrazo.name , arguments: user);

            }
            ),
              
          ],
        ),
      ),
    );
  }
}

