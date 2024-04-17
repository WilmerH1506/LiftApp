import 'package:flutter/material.dart';

class CrearRutinas extends StatelessWidget
{
  const  CrearRutinas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 82, 71, 123),
      appBar: AppBar(
        title: const Text(
          'Registro',
          style: TextStyle(color: Colors.white),
        )
      )
    );
  } 
}