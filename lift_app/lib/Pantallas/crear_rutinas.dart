import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Widgets/board.dart';
import 'package:lift_app/Widgets/bottomsheet.dart';
import 'package:lift_app/Widgets/bsdescargar.dart';
import 'package:lift_app/Widgets/bsdborrar.dart';

class CrearRutinasPage extends StatefulWidget {
    const CrearRutinasPage({Key? key}) : super(key: key);

    @override
    _CrearRutinasPageState createState() => _CrearRutinasPageState();
}

class _CrearRutinasPageState extends State<CrearRutinasPage> {
    final DraggableScrollableController _controller = DraggableScrollableController();
    final ValueNotifier<List<String>> exercisesNotifier = ValueNotifier<List<String>>([]);
    final ValueNotifier<String> nameNotifier = ValueNotifier<String>('');
    late String user;
    late String name;

    @override
    void didChangeDependencies() {
        super.didChangeDependencies();

        final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        user = args['user'];
        name = args.containsKey('name') ? args['name'] : '';  // Inicializa `name` con el valor del argumento, si existe

        nameNotifier.value = name;

        recargarEjercicios();
    }

    void recargarEjercicios() {
        final descargar = Descargar();
        descargar.bsdescargar(user).then((exercisesList) {
            if (exercisesList.isNotEmpty) {
                exercisesNotifier.value = exercisesList;
            }
        }).catchError((error) {
            print('Error al descargar ejercicios: $error');
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
                title: const Text('Crear Rutinas', style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                )),
                backgroundColor: Colors.redAccent,
                actions: [
                    IconButton(
                        onPressed: () async {
                            bool? shouldLogout = await showDialog<bool>(
                                context: context,
                                builder: (context) {
                                    return AlertDialog(
                                        title: const Text('Confirmar cierre de sesión'),
                                        content: const Text('¿Estás seguro de que deseas salir? \n\nSe perderán todos los cambios no guardados'),
                                        actions: [
                                            TextButton(
                                                onPressed: () {
                                                    Navigator.of(context).pop(false);
                                                },
                                                child: const Text('Cancelar'),
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                    Navigator.of(context).pop(true);
                                                },
                                                child: const Text('Confirmar'),
                                            ),
                                        ],
                                    );
                                },
                            );
                            if (shouldLogout == true) {
                                final delete = Borrar();
                                delete.BorrarEjers(user);
                                Navigator.pushReplacementNamed(context, MyRoutes.inicio.name, arguments: user);
                            }
                        },
                        icon: const Icon(Icons.logout),
                    ),
                ],
            ),
            body: Stack(
                children: [
                    SingleChildScrollView(
                        child: GestureDetector(
                            onVerticalDragEnd: (details) {
                                if (details.primaryVelocity! < 0) {
                                    _controller.animateTo(
                                        0.3,
                                        duration: const Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                    );
                                }
                            },
                            child: Column(
                                children: [
                                    const Padding(padding: EdgeInsets.only(top: 20)),
                                    Board(
                                        titulo: "Tren Superior",
                                        ontap: () {
                                            Navigator.pushReplacementNamed(context, MyRoutes.menu_torso.name, arguments: {
                                                'user': user,
                                                'name': name,
                                            });
                                        },
                                        imagen: Image.asset('Assets/Superior.png'),
                                    ),
                                    const Padding(padding: EdgeInsets.only(top: 20)),
                                    Board(
                                        titulo: "Abdominales",
                                        ontap: () {
                                            Navigator.pushReplacementNamed(context, MyRoutes.abdominales.name, arguments: {
                                                'user': user,
                                                'name': name,
                                            });
                                        },
                                        imagen: Image.asset('Assets/Abs.png'),
                                    ),
                                    const Padding(padding: EdgeInsets.only(top: 20)),
                                    Board(
                                        titulo: "Tren Inferior",
                                        ontap: () {
                                            Navigator.pushReplacementNamed(context, MyRoutes.menu_inferior.name, arguments: {
                                                'user': user,
                                                'name': name,
                                            });
                                        },
                                        imagen: Image.asset('Assets/Inferior.png'),
                                    ),
                                    const Padding(padding: EdgeInsets.only(top: 20)),
                                    Board(
                                        titulo: "Espalda",
                                        ontap: () {
                                            Navigator.pushReplacementNamed(context, MyRoutes.menu_espalda.name, arguments: {
                                                'user': user,
                                                'name': name,
                                            });
                                        },
                                        imagen: Image.asset('Assets/Espalda.png'),
                                    ),
                                ],
                            ),
                        ),
                    ),
                    ValueListenableBuilder<List<String>>(
                        valueListenable: exercisesNotifier,
                        builder: (context, exercises, child) {
                            return DraggableScrollableSheet(
                                initialChildSize: 0.4,
                                minChildSize: 0.4,
                                maxChildSize: 0.9,
                                controller: _controller,
                                builder: (context, scrollController) {
                                    return Bottom(
                                        data: exercises,
                                        nameNotifier: nameNotifier,
                                        user: user,
                                        onReload: recargarEjercicios,
                                    );
                                },
                            );
                        },
                    ),
                    // Usa un ValueListenableBuilder para mantener `name` sincronizado con `nameNotifier`
                    ValueListenableBuilder<String>(
                        valueListenable: nameNotifier,
                        builder: (context, currentName, child) {
                            name = currentName;  // Actualiza `name` cuando `nameNotifier` cambia
                            return Container();  // Este `ValueListenableBuilder` es solo para actualizar `name`
                        },
                    ),
                ],
            ),
        );
    }
}
