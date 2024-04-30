import 'package:flutter/material.dart';
import 'package:lift_app/Widgets/agregargif.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Widgets/bsdtemporal.dart';

class Laterales extends StatelessWidget {
    const Laterales({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        // Obtener argumentos de Navigator
        final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        final user = arguments['user'] as String;
        final name = arguments['name'] as String;
        final showAddButton = arguments.containsKey('showAddButton') ? arguments['showAddButton'] as bool : false; // Predeterminado a false si no se proporciona

        return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
                title: const Row(
                    children: [
                        Text(
                            'Vuelos Laterales',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                            ),
                        ),
                        Icon(Icons.sports_gymnastics_sharp),
                    ],
                ),
                backgroundColor: Colors.redAccent,
                actions: [
                    IconButton(
                        onPressed: () {
                            // Controlar el comportamiento del botón "Salir" según showAddButton
                            if (showAddButton) {
                                // Redirige a la página de menú de hombros
                                Navigator.pushReplacementNamed(context, MyRoutes.ejercicios.name, arguments: {
                                    'user': user,
                                    'name': name,
                                });
                            } else {
                                // Redirige a la página de creación de rutinas
                                Navigator.pushReplacementNamed(context, MyRoutes.menu_hombros.name, arguments: {
                                    'user': user,
                                    'name': name,
                                });
                            }
                        },
                        icon: const Icon(Icons.logout),
                    ),
                ],
            ),
            body: SingleChildScrollView(
                child: Column(
                    children: [
                        // GIF del ejercicio Laterales
                        Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                                width: 500,
                                height: 300,
                                decoration: BoxDecoration(
                                    color: Colors.deepOrange,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: Colors.black26,
                                        width: 5,
                                    ),
                                ),
                                child: FutureBuilder<Widget>(
                                    future: AggGif('Videos/Laterales.gif').getGifWidget(),
                                    builder: (context, snapshot) {
                                        if (snapshot.connectionState == ConnectionState.waiting) {
                                            return const Center(child: CircularProgressIndicator());
                                        } else {
                                            return snapshot.data!;
                                        }
                                    },
                                ),
                            ),
                        ),
                        
                        const SizedBox(height: 25),
                        
                        // Título y descripción
                        const Row(
                            children: [
                                Text(
                                    'Vuelos Laterales',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                    ),
                                ),
                            ],
                        ),
                        
                        const SizedBox(height: 5),
                        
                        const Row(
                            children: [
                                SizedBox(width: 10),
                                Text(
                                    'Primario: Hombro Lateral',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                    ),
                                ),
                            ],
                        ),
                        
                        const SizedBox(height: 5),
                        
                        const Row(
                            children: [
                                SizedBox(width: 10),
                                Text(
                                    'Secundario: ----',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                    ),
                                ),
                            ],
                        ),
                        
                        const SizedBox(height: 28),
                        
                        // Niveles de dificultad
                        const Row(
                            children: [
                                SizedBox(width: 1),
                                Text(
                                    'Principiante',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                    ),
                                ),
                                SizedBox(width: 20),
                                Text(
                                    'Intermedio',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                    ),
                                ),
                                SizedBox(width: 20),
                                Text(
                                    'Avanzado',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                    ),
                                ),
                            ],
                        ),
                        
                        const SizedBox(height: 5),
                        
                        const Row(
                            children: [
                                SizedBox(width: 53),
                                Icon(Icons.star, color: Colors.yellow),
                                SizedBox(width: 83),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                SizedBox(width: 56),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                            ],
                        ),
                        
                        const SizedBox(height: 16),
                        const Row(
                            children: [
                                Column(
                                    children: [
                                        Text(
                                            '4 Sets',
                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                            '10 - 15',
                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                            'Repeticiones',
                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
                                        ),
                                    ],
                                ),
                                SizedBox(width: 35),
                                Column(
                                    children: [
                                        Text(
                                            '4 Sets',
                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                            '8 - 12',
                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                            'Repeticiones',
                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
                                        ),
                                    ],
                                ),
                                SizedBox(width: 17),
                                Column(
                                    children: [
                                        Text(
                                            '4 Sets',
                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                            '6 - 10',
                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                            'Repeticiones',
                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
                                        ),
                                    ],
                                ),
                            ],
                        ),
                        
                        const SizedBox(height: 20),
                        
                        const Row(
                            children: [
                                Column(
                                    children: [
                                        Text(
                                            '**Nota: Debe elegir un peso el cual se sienta cómodo realizándolo',
                                            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 11),
                                        ),
                                        Text(
                                            'El peso debe ser el máximo posible que le permita realizar',
                                            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 11),
                                        ),
                                        Text(
                                            'Con la mejor técnica para mejores resultados',
                                            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 11),
                                        ),
                                    ],
                                ),
                            ],
                        ),
                        
                        const SizedBox(height: 40),
                        
                        // Mostrar el botón "Agregar Rutina" si `showAddButton` es `false`
                        if (!showAddButton)
                            ElevatedButton(
                                onPressed: () {
                                    final subir = Temporal();
                                    subir.bsdTemporal(user, 'Vuelos Laterales', name);
                                    Navigator.pushReplacementNamed(context, MyRoutes.crear_rutinas.name, arguments: {
                                        'user': user,
                                        'name': name,
                                    });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    minimumSize: const Size(250, 50),
                                ),
                                child: const Text(
                                    'Agregar Rutina',
                                    style: TextStyle(color: Colors.white),
                                ),
                            ),
                    ],
                ),
            ),
        );
    }
}
