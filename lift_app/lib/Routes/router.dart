




import 'package:flutter/material.dart';
import 'package:lift_app/Pantallas/abdominales.dart';
import 'package:lift_app/Pantallas/crear_rutinas.dart';
import 'package:lift_app/Pantallas/registro.dart';
import 'package:lift_app/Pantallas/rutinas.dart';
import 'my_routes.dart';
import 'package:lift_app/Pantallas/login.dart';
import 'package:lift_app/Pantallas/inicio.dart';


final Map<String, Widget Function(BuildContext)> routes = {
  MyRoutes.login.name: (context) => Login(),
  MyRoutes.registro.name: (context) => Registro(),
  MyRoutes.inicio.name: (context) => Inicio(),
  MyRoutes.abdominales.name:(context) => Myabs(),
  MyRoutes.crear_rutinas.name:(context) => CrearRutinasPage(),
  MyRoutes.rutinas.name:(context) => RutinasPage()
};