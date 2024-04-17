import 'package:flutter/material.dart';
import 'package:lift_app/Pantallas/crear_rutinas.dart';
import 'package:lift_app/Pantallas/perfil.dart';
import 'package:lift_app/Pantallas/rutinas.dart';

class Inicio extends StatefulWidget {
  Inicio({Key? key, this.currentIndex = 0}) : super(key: key);

  int currentIndex;
  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            widget.currentIndex = value;
          });
        },
        children: const [
          RutinasPage(),
          CrearRutinasPage(),
          PerfilPage(),
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
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('Assets/pesa.png', width: 35, height: 35),
            label: 'Mis rutinas',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('Assets/mas.png', width: 35, height: 35),
            label: 'Crear Rutinas',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('Assets/usuario.png', width: 35, height: 35),
            label: 'Perfil',
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 255, 251, 251),
        backgroundColor: const Color.fromARGB(255, 46, 46, 46),
      ),
    );
  }
}
