import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Widgets/bsdborrar.dart';
import 'package:lift_app/Widgets/bsdFinal.dart';
import 'package:lift_app/Widgets/bsdborrarejer.dart';

class Bottom extends StatelessWidget {
    final List<String> data; 
    final String user;
    final VoidCallback onReload; 

    const Bottom({super.key, required this.data, required this.user, required this.onReload});

    @override
    Widget build(BuildContext context) {
        return SingleChildScrollView(
            child: Column(
                children: [
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                const Text(
                                    'Rutina actual',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                    ),
                                ),
                                IconButton(
                                    onPressed: onReload, 
                                    icon: const Icon(
                                        Icons.refresh,
                                        color: Colors.white,
                                    ),
                                ),
                            ],
                        ),
                    ),
                    ...data.map((exercise) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: BottomSheetDummyUI(
                                exercise: exercise, 
                                user: user,
                                onDelete: () async {
                                    final borrarEjer = BorrarEjer();
                                    await borrarEjer.borrar(user, exercise);

                                    onReload();
                                },
                            ),
                        );
                    }).toList(),
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: () async {
                                final subirFinal = Final();
                                await subirFinal.subirRutina(context,user, data);
                                final borrarTemporal = Borrar();
                                borrarTemporal.BorrarEjers(user);
                                Navigator.pushReplacementNamed(context, MyRoutes.inicio.name, arguments: user);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                minimumSize: const Size(double.infinity, 50),
                            ),
                            child: const Text(
                                'Guardar rutina',
                                style: TextStyle(color: Colors.white),
                            ),
                        ),
                    ),
                ],
            ),
        );
    }
}


class BottomSheetDummyUI extends StatelessWidget {
  final String exercise; 
  final String user;
  final VoidCallback onDelete;

  const BottomSheetDummyUI({super.key, required this.exercise, required this.onDelete, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
            children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                        color: Colors.redAccent,
                        height: 100,
                        width: 100,
                    ),
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(
                                exercise,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                ),
                            ),
                            const SizedBox(height: 5),
                        ],
                    ),
                ),
                IconButton(
                    onPressed: () async {
                        onDelete();
                    },
                    icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                    ),
                ),
            ],
        ),
    );
  }
}
