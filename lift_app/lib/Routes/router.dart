


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
import 'package:lift_app/Pantallas/Menu%20MisRutinas/menumisrutinas.dart';
import 'package:lift_app/Pantallas/addrutinascalendar_page.dart';
import 'package:lift_app/Pantallas/crear_rutinas.dart';
import 'package:lift_app/Pantallas/editarrutina.dart';
import 'package:lift_app/Pantallas/registro.dart';
import 'package:lift_app/Pantallas/rutinas.dart';
import 'my_routes.dart';
import 'package:lift_app/Pantallas/login.dart';
import 'package:lift_app/Pantallas/inicio.dart';


final Map<String, Widget Function(BuildContext)> routes = {
  MyRoutes.login.name:(context) =>const Login(),
  MyRoutes.registro.name:(context) => const Registro(),
  MyRoutes.inicio.name:(context) => Inicio(),
  MyRoutes.abdominales.name:(context) => const Myabs(),
  MyRoutes.crear_rutinas.name:(context) => const CrearRutinasPage(),
  MyRoutes.rutinas.name:(context) => RutinasPage(),
  MyRoutes.menu_espalda.name:(context) =>const MenuEspalda(),
  MyRoutes.jalon_pecho.name:(context) => const JalonPecho(),
  MyRoutes.remos.name: (context) => const Remos(),
  MyRoutes.pullups.name: (context) => const PullUps(),
  MyRoutes.face_pulls.name: (context) => const FacePulls(),
  MyRoutes.remos_mancuerna.name: (context) => const RemosMancuerna(),
  MyRoutes.menu_superior.name: (context) => const TrenSuperior(),
  MyRoutes.sobrecabeza.name: (context) => const SobreCabeza(),
  MyRoutes.press_frances.name: (context) => const PressFrances(),
  MyRoutes.fondos.name: (context) => const Fondos(),
  MyRoutes.extension_barra.name: (context) => const ExtensionBarra(),
  MyRoutes.extension_polea.name: (context) => const ExtensionPolea(),
  MyRoutes.menu_torso.name: (context) => const MenuTorso(),
  MyRoutes.menu_pecho.name: (context) => const MenuPecho(),
  MyRoutes.pecho_inferior.name: (context) => const PressDeclinado(),
  MyRoutes.pecho_plano.name: (context) => const PressPlano(),
  MyRoutes.pecho_superior.name: (context) => const PressInclinado(),
  MyRoutes.menu_biceps.name: (context) => const MenuBiceps(),
  MyRoutes.antebrazo.name: (context) => const Antebrazo(),
  MyRoutes.curl.name: (context) => const Curl(),
  MyRoutes.martillo.name: (context) => const Martillo(),
  MyRoutes.predicador.name: (context) => const Predicador(),
  MyRoutes.menu_hombros.name: (context) => const MenuHombro(),
  MyRoutes.laterales.name: (context) => const Laterales(),
  MyRoutes.vuelos_posteriores.name: (context) =>  const Posteriores(),
  MyRoutes.press_militar.name: (context) => const PressMilitar(),
  MyRoutes.abductores.name: (context) => const Abductores(),
  MyRoutes.menu_cuadriceps.name: (context) => const MenuCuadriceps(),
  MyRoutes.zancadas.name: (context) => const Zancadas(),
  MyRoutes.sentadilla.name: (context) =>const Sentadilla(),
  MyRoutes.prensa.name: (context) => const Prensa(),
  MyRoutes.extensiones.name: (context) => const Extensiones(),
  MyRoutes.bulgaras.name: (context) => const Bulgaras(),
  MyRoutes.menu_inferior.name: (context) => const MenuPierna(),
  MyRoutes.menu_femoral.name: (context) => const MenuFemoral(),
  MyRoutes.femoral_acostado.name: (context) =>const FemoralAcostado(),
  MyRoutes.femoral_sentado.name: (context) => const FemoralSentado(),
  MyRoutes.pesomuerto.name: (context) => const PesoMuerto(),
  MyRoutes.menu_gluteo.name: (context ) => const MenuGluteo(),
  MyRoutes.patada.name: (context) => const Patada(),
  MyRoutes.hip_thrust.name: (context) =>const HipThrust(),
  MyRoutes.sumo.name: (context) => const Sumo(),
  MyRoutes.menu_pantorillas.name: (context) => const MenuPantorillas(),
  MyRoutes.elevaciones_parado.name: (context) => const ElevacionesParado(),
  MyRoutes.elevaciones_sentado.name: (context) =>  const ElevacionesSentado(),
  MyRoutes.addrutineCalendar.name: (context) => const AddRuntineCalendar(),
  MyRoutes.ejercicios.name: (context) => Ejercicios(),
  MyRoutes.editar.name: (context) => Editar()
};
