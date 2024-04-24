import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Widgets/board.dart';

class MenuFemoral extends StatelessWidget {
  const MenuFemoral({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
        final  user = ModalRoute.of(context)!.settings.arguments as String;

    return  Scaffold(
    appBar: AppBar(
          title: const Row(
            children: [
               Text('Menu De Femorales',style: TextStyle(
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
              titulo: "Femoral Acostado",
               ontap: (){
                Navigator.pushReplacementNamed(context, MyRoutes.femoral_acostado.name,arguments: user);
               },
               imagen: Image.asset('Assets/FemoralAcos.png'),
               ),
           const  Padding(
              padding:  EdgeInsets.only(top: 20),
            ),
            Board(
               titulo: "Femoral Sentado",
                ontap: (){
                  Navigator.pushReplacementNamed(context, MyRoutes.femoral_sentado.name , arguments: user);
                },
                imagen: Image.asset('Assets/FemoralSent.png'),
               ),
            const Padding(padding:  EdgeInsets.only(top: 20),
            ),
            Board(
            titulo: "Peso Muerto",
            ontap: (){
            Navigator.pushReplacementNamed(context, MyRoutes.pesomuerto.name , arguments: user);
            },
            imagen: Image.asset('Assets/Pesomuerto.png'),
            ),
          ],
        ),
      ),
    );
  }
}

