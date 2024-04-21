import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Widgets/board.dart';

class MenuPierna extends StatelessWidget {
  const MenuPierna ({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
        final  user = ModalRoute.of(context)!.settings.arguments as String;

    return  Scaffold(
    appBar: AppBar(
          title: const Row(
            children: [
               Text('Menu Tren Inferior',style: TextStyle(
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
              titulo: "Cuadriceps",
               ontap: (){
                Navigator.pushReplacementNamed(context, MyRoutes.menu_cuadriceps.name,arguments: user);
               },),
           const  Padding(
              padding:  EdgeInsets.only(top: 20),
            ),
            Board(
               titulo: "Femorales",
                ontap: (){
                  Navigator.pushReplacementNamed(context, MyRoutes.menu_femoral.name , arguments: user);
                }
               ),
            const Padding(padding:  EdgeInsets.only(top: 20),
            ),
            Board(
            titulo: "Abductores",
            ontap: (){
            Navigator.pushReplacementNamed(context, MyRoutes.abductores.name , arguments: user);

            }
            ),
            const Padding(padding:  EdgeInsets.only(top: 20),
            ),
            Board(
              titulo: "Gluteos",
              ontap: (){
              Navigator.pushReplacementNamed(context, MyRoutes.menu_gluteo.name , arguments: user);
              }
              ),
              const Padding(padding:  EdgeInsets.only(top: 20),
            ),
            Board(
              titulo: "Pantorillas",
              ontap: (){
              Navigator.pushReplacementNamed(context, MyRoutes.menu_pantorillas.name , arguments: user);
              }
              ),          
          ],
        ),
      ),
    );
  }
}

