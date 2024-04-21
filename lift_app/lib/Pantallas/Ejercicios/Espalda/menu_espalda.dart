import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Widgets/board.dart';

class MenuEspalda extends StatelessWidget {
  const MenuEspalda({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
        final  user = ModalRoute.of(context)!.settings.arguments as String;

    return  Scaffold(
    appBar: AppBar(
          title: const Row(
            children: [
               Text('Menu Espalda',style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),),
          Icon(Icons.sports_gymnastics_sharp)
            ],
          ),
          backgroundColor: Colors.redAccent,
          actions: [IconButton(onPressed: () {
            Navigator.pushReplacementNamed(context, MyRoutes.inicio.name,arguments: user);
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
              titulo: "Jalon Al Pecho",
               ontap: (){
                Navigator.pushReplacementNamed(context, MyRoutes.jalon_pecho.name, arguments: user );
               },),
           const  Padding(
              padding:  EdgeInsets.only(top: 20),
            ),
            Board(
               titulo: "Remos Con Barra",
                ontap: (){
                  Navigator.pushReplacementNamed(context, MyRoutes.remos.name , arguments: user);
                }
               ),
            const Padding(padding:  EdgeInsets.only(top: 20),
            ),
            Board(
            titulo: "Pull-Ups (Dominadas)",
            ontap: (){
            Navigator.pushReplacementNamed(context, MyRoutes.pullups.name , arguments: user);

            }
            ),
            const Padding(padding:  EdgeInsets.only(top: 20),
            ),
            Board(
              titulo: "Face-Pulls (Jalones A La Cabeza)",
              ontap: (){
              Navigator.pushReplacementNamed(context, MyRoutes.face_pulls.name , arguments: user);

              }
              ),
               const Padding(padding:  EdgeInsets.only(top: 20),
            ),
            Board(
              titulo: "Remos Con Mancuerna",
              ontap: (){
              Navigator.pushReplacementNamed(context, MyRoutes.remos_mancuerna.name , arguments: user);

              }
              )
          ],
        ),
      ),
    );
  }
}

