import 'package:flutter/material.dart';

class RutinasPage extends StatelessWidget {
  const RutinasPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text('Mis Rutinas', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}