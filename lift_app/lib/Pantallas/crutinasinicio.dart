import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';

class CreateRoutine extends StatelessWidget {
    final String user;
    
    CreateRoutine({Key? key, required this.user}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        
        final screenHeight = MediaQuery.of(context).size.height;
        final welcomeHeight = screenHeight / 4;
        String name = '';

        return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
                title: const Text('Crear Rutinas', style: TextStyle(fontWeight:FontWeight.bold),),
                backgroundColor: Colors.redAccent,
            ),
            body: Column(
                children: [
                    Container(
                        height: 200,
                        width: double.infinity, 
                        padding: const EdgeInsets.all(16),
                        color: Colors.black, 
                        child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                '¡Bienvenido, $user!',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                   ),
                                ),
                               const Text('Empecemos a esculpir tu cuerpo!',
                                 style: TextStyle(
                                  color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                 ),
                                )
                              ],
                            )
                        ),
                    ),
                   
                    const SizedBox(height: 10),
                    Container(
                        height: 350,
                        width: double.infinity, 
                        padding: const EdgeInsets.all(16),
                        color: Colors.black, 
                            child: Column(
                              children: [
                                Image.asset('Assets/CRinicio.png',
                                width: 400,
                                height: 200,
                                fit: BoxFit.fill,
                                )
                              ],
                            )
                        ),
                    ElevatedButton(
                        onPressed: () {
                           Navigator.pushReplacementNamed(context, MyRoutes.crear_rutinas.name, arguments: {'user': user, 'name': name});
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                            ),
                        ),
                        child: const Text(
                            'Crear Rutinas',
                            style: TextStyle(fontSize: 18),
                        ),
                    ),
                ],
            ),
        );
    }
}
