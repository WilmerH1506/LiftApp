// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lift_app/Pantallas/crutinasinicio.dart';
import 'package:lift_app/Pantallas/misrutinasinicio.dart';
import 'package:lift_app/Pantallas/perfil.dart';

class Inicio extends StatefulWidget {
  Inicio({Key? key, this.currentIndex = 0}) : super(key: key);
  
  int currentIndex;
  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  
  
  final PageController pageController = PageController(); 
  FirebaseFirestore firestore = FirebaseFirestore.instance; 

  @override
  Widget build(BuildContext context) {
      

    final user = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: Colors.black,
  
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            widget.currentIndex = value;
          });
        },
        children:  [
           MisRutinas(user: user),
           CreateRoutine(user: user,),          
           PerfilPage(user:user),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.currentIndex,
        onTap: (index) {
          setState(() {
            widget.currentIndex = index;
          });

          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        items: const [
             BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.dumbbell, color: Colors.redAccent, size: 25),
            label: '  Mis rutinas',
          ),
           BottomNavigationBarItem(
             icon: Icon(FontAwesomeIcons.fileCirclePlus, color: Colors.redAccent, size: 25),
            label: 'Crear Rutinas',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userClock, color: Colors.redAccent, size: 25),
            label: 'Perfil',
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 255, 251, 251),
        backgroundColor: const Color.fromARGB(255, 46, 46, 46),
      ),
    );
  }
}
