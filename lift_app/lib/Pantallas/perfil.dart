import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Widgets/adddatebar.dart';
import 'package:lift_app/Widgets/addrutinesbar.dart';


class PerfilPage extends StatelessWidget {
 const  PerfilPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final  user = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
       title: Text(user,style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),),
          actions: [IconButton(
            onPressed: () {
            Navigator.pushReplacementNamed(context,MyRoutes.login.name);
            },
            icon: const Icon(Icons.logout),
            
          )],
       backgroundColor: Colors.redAccent,
      ),
    
      body: Column(
        children: [
          addRutinebar(context),
          addDatebar(),
        ],
        )
      );
  }
}


