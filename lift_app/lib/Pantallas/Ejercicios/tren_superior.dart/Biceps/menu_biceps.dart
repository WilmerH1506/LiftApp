import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Widgets/board.dart';

class MenuBiceps extends StatelessWidget {
  const MenuBiceps({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
        
        final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      
        final user = arguments['user'];
        final name = arguments['name'];

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
             Navigator.pushReplacementNamed(context, MyRoutes.menu_torso.name, arguments: {
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
              titulo: "Curl De Biceps",
               ontap: (){
                 Navigator.pushReplacementNamed(context, MyRoutes.curl.name, arguments: {
                                                'user': user,
                                                'name': name,
                                            });
               },
               imagen: Image.asset('Assets/CurlB.png'),
               ),
           const  Padding(
              padding:  EdgeInsets.only(top: 20),
            ),
            Board(
               titulo: "Predicador",
                ontap: (){
                  Navigator.pushReplacementNamed(context, MyRoutes.predicador.name, arguments: {
                                                'user': user,
                                                'name': name,
                                            });
                },
                imagen: Image.asset('Assets/Predicador.png'),
               ),
            const Padding(padding:  EdgeInsets.only(top: 20),
            ),
            Board(
            titulo: "Martillo",
            ontap: (){
              Navigator.pushReplacementNamed(context, MyRoutes.martillo.name, arguments: {
                                                'user': user,
                                                'name': name,
                                            });
            },
            imagen: Image.asset('Assets/Martillo.png'),
            ),
            const Padding(padding:  EdgeInsets.only(top: 20),
            ),
            Board(
            titulo: "Antebrazo",
            ontap: (){
              Navigator.pushReplacementNamed(context, MyRoutes.antebrazo.name, arguments: {
                                                'user': user,
                                                'name': name,
                                            });
            },
            imagen: Image.asset('Assets/Antebrazo.png'),
            ),
              
          ],
        ),
      ),
    );
  }
}

