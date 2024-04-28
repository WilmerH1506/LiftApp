import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Widgets/board.dart';

class MenuCuadriceps extends StatelessWidget {
  const MenuCuadriceps({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
      final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      
        final user = arguments['user'];
        final name = arguments['name'];

    return  Scaffold(
    appBar: AppBar(
          title: const Row(
            children: [
               Text('Menu De Cuadriceps',style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),),
          Icon(Icons.sports_gymnastics_sharp)
            ],
          ),
          backgroundColor: Colors.redAccent,
          actions: [IconButton(onPressed: () {
             Navigator.pushReplacementNamed(context, MyRoutes.menu_inferior.name, arguments: {
                                                'user': user,
                                                'name': name,
                                            });
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
              titulo: "Sentadilla",
               ontap: (){
                 Navigator.pushReplacementNamed(context, MyRoutes.sentadilla.name, arguments: {
                                                'user': user,
                                                'name': name,
                                            });
               },
               imagen: Image.asset('Assets/Sentadilla.png'),
               ),
           const  Padding(
              padding:  EdgeInsets.only(top: 20),
            ),
            Board(
               titulo: "Extensiones",
                ontap: (){
                  Navigator.pushReplacementNamed(context, MyRoutes.extensiones.name, arguments: {
                                                'user': user,
                                                'name': name,
                                            });
                },
                imagen: Image.asset('Assets/Extensiones.png'),
               ),
            const Padding(padding:  EdgeInsets.only(top: 20),
            ),
            Board(
            titulo: "Prensa",
            ontap: (){
            Navigator.pushReplacementNamed(context, MyRoutes.prensa.name, arguments: {
                                                'user': user,
                                                'name': name,
                                            });
            },
            imagen: Image.asset('Assets/Prensa.png'),
            ),
            const Padding(padding:  EdgeInsets.only(top: 20),
            ),
            Board(
            titulo: "Bulgaras",
            ontap: (){
             Navigator.pushReplacementNamed(context, MyRoutes.bulgaras.name, arguments: {
                                                'user': user,
                                                'name': name,
                                            });
            },
            imagen: Image.asset('Assets/Bulgaras.png'),
            ),
             const Padding(padding:  EdgeInsets.only(top: 20),
            ),
            Board(
            titulo: "Zancadas",
            ontap: (){
            Navigator.pushReplacementNamed(context, MyRoutes.zancadas.name, arguments: {
                                                'user': user,
                                                'name': name,
                                            });
            },
            imagen: Image.asset('Assets/Zancadas.png'),
            ),
              
          ],
        ),
      ),
    );
  }
}

