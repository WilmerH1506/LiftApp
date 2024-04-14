import 'package:flutter/material.dart';
import 'package:lift_app/Pantallas/registro.dart';
import 'my_routes.dart';
import 'package:lift_app/Pantallas/login.dart';


final Map<String, Widget Function(BuildContext)> routes = {
  MyRoutes.login.name: (context) => Login(),
  MyRoutes.registro.name: (context) => Registro()
};