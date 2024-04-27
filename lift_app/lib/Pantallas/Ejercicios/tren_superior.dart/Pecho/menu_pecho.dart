import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Widgets/board.dart';

class MenuPecho extends StatelessWidget {
  const MenuPecho({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
        final  user = ModalRoute.of(context)!.settings.arguments as String;

    return  Scaffold(
    appBar: AppBar(
          title: const Row(
            children: [
               Text('Menu De Pecho',style: TextStyle(
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
              titulo: "Press Inclinado",
               ontap: (){
                Navigator.pushReplacementNamed(context, MyRoutes.pecho_superior.name,arguments: user);
               },
               imagen: Image.asset('Assets/Inclinado.png'),
               ),
           const  Padding(
              padding:  EdgeInsets.only(top: 20),
            ),
            Board(
               titulo: "Press Plano",
                ontap: (){
                  Navigator.pushReplacementNamed(context, MyRoutes.pecho_plano.name , arguments: user);
                },
                imagen: Image.asset('Assets/Plano.png'),
               ),
            const Padding(padding:  EdgeInsets.only(top: 20),
            ),
            Board(
            titulo: "Press Declinado",
            ontap: (){
            Navigator.pushReplacementNamed(context, MyRoutes.pecho_inferior.name , arguments: user);
            },
            imagen: Image.asset('Assets/Declinado.png'),
            ),
           
              
          ],
        ),
      ),
    );
  }
}

