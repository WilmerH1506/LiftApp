import 'package:flutter/material.dart';
import 'package:lift_app/Pantallas/registro.dart';
import 'my_routes.dart';
import 'package:lift_app/Pantallas/login.dart';
import 'package:lift_app/Pantallas/inicio.dart';


final Map<String, Widget Function(BuildContext)> routes = {
  MyRoutes.login.name: (context) => Login(),
  MyRoutes.registro.name: (context) => Registro(),
  MyRoutes.inicio.name: (context) => Inicio(),
};