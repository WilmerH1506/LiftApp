import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Widgets/agregargif.dart';
import 'package:lift_app/Widgets/bsdtemporal.dart';

class HipThrust extends StatelessWidget {
    const HipThrust({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        final user = arguments['user'];
        final name = arguments['name'];
        final showAddButton = arguments.containsKey('showAddButton') ? arguments['showAddButton'] as bool : false;

        return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
                title: const Row(
                    children: [
                        Text(
                            'Hip Thrust',
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
                            if (showAddButton) {
                                Navigator.pushReplacementNamed(context, MyRoutes.ejercicios.name, arguments: {
                                    'user': user,
                                    'name': name,
                                });
                            } else {
                                Navigator.pushReplacementNamed(context, MyRoutes.menu_gluteo.name, arguments: {
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
                        Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                                width: 500,
                                height: 200,
                                decoration: BoxDecoration(
                                    color: Colors.deepOrange,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: Colors.black26,
                                        width: 5,
                                    ),
                                ),
                                child: FutureBuilder<Widget>(
                                    future: AggGif('Videos/Hip_Thrust.gif').getGifWidget(),
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
                        const Row(
                            children: [
                                Text(
                                    'Hip Thrust',
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
                                    'Primario: Glúteos',
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
                                    'Secundario: Femoral',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                    ),
                                ),
                            ],
                        ),
                        const SizedBox(height: 28),
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
                        const SizedBox(height: 36),
                        const Row(
                            children: [
                                Column(
                                    children: [
                                        Text(
                                            '4 Sets',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                            ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                            '10 - 15',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                            ),
                                        ),
                                        Text(
                                            'Repeticiones',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                            ),
                                        ),
                                    ],
                                ),
                                SizedBox(width: 5),
                                Column(
                                    children: [
                                        Text(
                                            '4 Sets',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                            ),
                                        ),
                                        Text(
                                            '8 - 12',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                            ),
                                        ),
                                        Text(
                                            'Repeticiones',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                            ),
                                        ),
                                    ],
                                ),
                                SizedBox(width: 17),
                                Column(
                                    children: [
                                        Text(
                                            '4 Sets',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                            ),
                                        ),
                                        Text(
                                            '6 - 10',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                            ),
                                        ),
                                        Text(
                                            'Repeticiones',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                            ),
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
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11,
                                            ),
                                        ),
                                        Text(
                                            'El peso debe ser el máximo posible que le permita realizar',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11,
                                            ),
                                        ),
                                        Text(
                                            'Con la mejor técnica para mejores resultados',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11,
                                            ),
                                        ),
                                    ],
                                ),
                            ],
                        ),
                        if (showAddButton)
                            ElevatedButton(
                                onPressed: () {
                                    final subir = Temporal();
                                    subir.bsdTemporal(user, 'Hip thrust', name);
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
