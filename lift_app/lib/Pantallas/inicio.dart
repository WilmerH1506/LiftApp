import 'package:flutter/material.dart';

class CrearRutinasPage extends StatelessWidget {
  const CrearRutinasPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text('Crear Rutinas', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class PerfilPage extends StatelessWidget {
  const PerfilPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text('Perfil', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

// ignore: must_be_immutable
class Inicio extends StatefulWidget {
  Inicio({Key? key, this.currentIndex = 0}) : super(key: key);

  int currentIndex;
  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          widget.currentIndex = value;
          setState(() {});
        },
        children: const [
          CrearRutinasPage(),
          PerfilPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.currentIndex,
        onTap: (index) {
          widget.currentIndex = index;

          pageController.animateToPage(
            index,
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 300),
          );
          setState(() {});
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
        selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
