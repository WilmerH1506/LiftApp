











import 'package:flutter/material.dart';
import 'package:lift_app/Pantallas/Ejercicios/Espalda/face_pulls.dart';
import 'package:lift_app/Pantallas/Ejercicios/Espalda/jalon_pecho.dart';
import 'package:lift_app/Pantallas/Ejercicios/Espalda/menu_espalda.dart';
import 'package:lift_app/Pantallas/Ejercicios/Espalda/pullups.dart';
import 'package:lift_app/Pantallas/Ejercicios/Espalda/remos.dart';
import 'package:lift_app/Pantallas/Ejercicios/Espalda/remos_mancuerna.dart';
import 'package:lift_app/Pantallas/Ejercicios/Tren%20Inferior/Abductores/abductor.dart';
import 'package:lift_app/Pantallas/Ejercicios/Tren%20Inferior/Cuadriceps/bulgaras.dart';
import 'package:lift_app/Pantallas/Ejercicios/Tren%20Inferior/Cuadriceps/extensiones.dart';
import 'package:lift_app/Pantallas/Ejercicios/Tren%20Inferior/Cuadriceps/menu_cuadriceps.dart';
import 'package:lift_app/Pantallas/Ejercicios/Tren%20Inferior/Cuadriceps/prensa.dart';
import 'package:lift_app/Pantallas/Ejercicios/Tren%20Inferior/Cuadriceps/sentadilla.dart';
import 'package:lift_app/Pantallas/Ejercicios/Tren%20Inferior/Cuadriceps/zancadas.dart';
import 'package:lift_app/Pantallas/Ejercicios/Tren%20Inferior/Femoral/femoral_acostado.dart';
import 'package:lift_app/Pantallas/Ejercicios/Tren%20Inferior/Femoral/femoral_sentado.dart';
import 'package:lift_app/Pantallas/Ejercicios/Tren%20Inferior/Femoral/menu_femoral.dart';
import 'package:lift_app/Pantallas/Ejercicios/Tren%20Inferior/Femoral/pesomuerto.dart';
import 'package:lift_app/Pantallas/Ejercicios/Tren%20Inferior/Gluteo/hip_thrust.dart';
import 'package:lift_app/Pantallas/Ejercicios/Tren%20Inferior/Gluteo/menu_gluteo.dart';
import 'package:lift_app/Pantallas/Ejercicios/Tren%20Inferior/Gluteo/patada.dart';
import 'package:lift_app/Pantallas/Ejercicios/Tren%20Inferior/Gluteo/sumo.dart';
import 'package:lift_app/Pantallas/Ejercicios/Tren%20Inferior/Pantorillas/elevaciones_parado.dart';
import 'package:lift_app/Pantallas/Ejercicios/Tren%20Inferior/Pantorillas/elevaciones_sentado.dart';
import 'package:lift_app/Pantallas/Ejercicios/Tren%20Inferior/Pantorillas/menu_pantorillas.dart';
import 'package:lift_app/Pantallas/Ejercicios/Tren%20Inferior/menu_inferior.dart';
import 'package:lift_app/Pantallas/Ejercicios/tren_superior.dart/Biceps/antebrazo.dart';
import 'package:lift_app/Pantallas/Ejercicios/tren_superior.dart/Biceps/curl.dart';
import 'package:lift_app/Pantallas/Ejercicios/tren_superior.dart/Biceps/martillo.dart';
import 'package:lift_app/Pantallas/Ejercicios/tren_superior.dart/Biceps/menu_biceps.dart';
import 'package:lift_app/Pantallas/Ejercicios/tren_superior.dart/Biceps/predicador.dart';
import 'package:lift_app/Pantallas/Ejercicios/tren_superior.dart/Hombros/laterales.dart';
import 'package:lift_app/Pantallas/Ejercicios/tren_superior.dart/Hombros/menu_hombros.dart';
import 'package:lift_app/Pantallas/Ejercicios/tren_superior.dart/Hombros/press_militar.dart';
import 'package:lift_app/Pantallas/Ejercicios/tren_superior.dart/Hombros/vuelos_posteriores.dart';
import 'package:lift_app/Pantallas/Ejercicios/tren_superior.dart/Pecho/menu_pecho.dart';
import 'package:lift_app/Pantallas/Ejercicios/tren_superior.dart/Pecho/pecho_inferior.dart';
import 'package:lift_app/Pantallas/Ejercicios/tren_superior.dart/Pecho/pecho_plano.dart';
import 'package:lift_app/Pantallas/Ejercicios/tren_superior.dart/Pecho/pecho_superior.dart';
import 'package:lift_app/Pantallas/Ejercicios/tren_superior.dart/Triceps/extension_barra.dart';
import 'package:lift_app/Pantallas/Ejercicios/tren_superior.dart/Triceps/extension_polea.dart';
import 'package:lift_app/Pantallas/Ejercicios/tren_superior.dart/Triceps/fondos.dart';
import 'package:lift_app/Pantallas/Ejercicios/tren_superior.dart/Triceps/menu_superior.dart';
import 'package:lift_app/Pantallas/Ejercicios/tren_superior.dart/Triceps/press_frances.dart';
import 'package:lift_app/Pantallas/Ejercicios/tren_superior.dart/Triceps/sobrecabeza.dart';
import 'package:lift_app/Pantallas/Ejercicios/abdominales.dart';
import 'package:lift_app/Pantallas/Ejercicios/tren_superior.dart/menu_torso.dart';
import 'package:lift_app/Pantallas/crear_rutinas.dart';
import 'package:lift_app/Pantallas/registro.dart';
import 'package:lift_app/Pantallas/rutinas.dart';
import 'my_routes.dart';
import 'package:lift_app/Pantallas/login.dart';
import 'package:lift_app/Pantallas/inicio.dart';


final Map<String, Widget Function(BuildContext)> routes = {
  MyRoutes.login.name:(context) => Login(),
  MyRoutes.registro.name:(context) => Registro(),
  MyRoutes.inicio.name:(context) => Inicio(),
  MyRoutes.abdominales.name:(context) => Myabs(),
  MyRoutes.crear_rutinas.name:(context) => CrearRutinasPage(),
  MyRoutes.rutinas.name:(context) => RutinasPage(),
  MyRoutes.menu_espalda.name:(context) => MenuEspalda(),
  MyRoutes.jalon_pecho.name:(context) => JalonPecho(),
  MyRoutes.remos.name: (context) => Remos(),
  MyRoutes.pullups.name: (context) => PullUps(),
  MyRoutes.face_pulls.name: (context) => FacePulls(),
  MyRoutes.remos_mancuerna.name: (context) => RemosMancuerna(),
  MyRoutes.menu_superior.name: (context) => TrenSuperior(),
  MyRoutes.sobrecabeza.name: (context) => SobreCabeza(),
  MyRoutes.press_frances.name: (context) => PressFrances(),
  MyRoutes.fondos.name: (context) => Fondos(),
  MyRoutes.extension_barra.name: (context) => ExtensionBarra(),
  MyRoutes.extension_polea.name: (context) => ExtensionPolea(),
  MyRoutes.menu_torso.name: (context) => MenuTorso(),
  MyRoutes.menu_pecho.name: (context) => MenuPecho(),
  MyRoutes.pecho_inferior.name: (context) => PressDeclinado(),
  MyRoutes.pecho_plano.name: (context) => PressPlano(),
  MyRoutes.pecho_superior.name: (context) => PressInclinado(),
  MyRoutes.menu_biceps.name: (context) => MenuBiceps(),
  MyRoutes.antebrazo.name: (context) => Antebrazo(),
  MyRoutes.curl.name: (context) => Curl(),
  MyRoutes.martillo.name: (context) => Martillo(),
  MyRoutes.predicador.name: (context) => Predicador(),
  MyRoutes.menu_hombros.name: (context) => MenuHombro(),
  MyRoutes.laterales.name: (context) => Laterales(),
  MyRoutes.vuelos_posteriores.name: (context) => Posteriores(),
  MyRoutes.press_militar.name: (context) => PressMilitar(),
  MyRoutes.abductores.name: (context) => Abductores(),
  MyRoutes.menu_cuadriceps.name: (context) => MenuCuadriceps(),
  MyRoutes.zancadas.name: (context) => Zancadas(),
  MyRoutes.sentadilla.name: (context) =>Sentadilla(),
  MyRoutes.prensa.name: (context) => Prensa(),
  MyRoutes.extensiones.name: (context) => Extensiones(),
  MyRoutes.bulgaras.name: (context) => Bulgaras(),
  MyRoutes.menu_inferior.name: (context) => MenuPierna(),
  MyRoutes.menu_femoral.name: (context) => MenuFemoral(),
  MyRoutes.femoral_acostado.name: (context) => FemoralAcostado(),
  MyRoutes.femoral_sentado.name: (context) => FemoralSentado(),
  MyRoutes.pesomuerto.name: (context) => PesoMuerto(),
  MyRoutes.menu_gluteo.name: (context ) => MenuGluteo(),
  MyRoutes.patada.name: (context) => Patada(),
  MyRoutes.hip_thrust.name: (context) => HipThrust(),
  MyRoutes.sumo.name: (context) => Sumo(),
  MyRoutes.menu_pantorillas.name: (context) => MenuPantorillas(),
  MyRoutes.elevaciones_parado.name: (context) => ElevacionesParado(),
  MyRoutes.elevaciones_sentado.name: (context) => ElevacionesSentado()
};
