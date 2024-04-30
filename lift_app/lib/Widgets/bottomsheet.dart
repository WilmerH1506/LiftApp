// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Widgets/bsdborrar.dart';
import 'package:lift_app/Widgets/bsdFinal.dart';
import 'package:lift_app/Widgets/bsdborrarejer.dart';

class Bottom extends StatefulWidget {
    final List<String> data;
    final String user;
    final VoidCallback onReload;
    final ValueNotifier<String> nameNotifier;

    const Bottom({
        super.key,
        required this.data,
        required this.user,
        required this.onReload,
        required this.nameNotifier
    });

    @override
    _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
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
                                    'Rutina actual:',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                    ),
                                ),
                                ValueListenableBuilder<String>(
                                    valueListenable: widget.nameNotifier,
                                    builder: (context, name, child) {
                                        return Text(
                                            name,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                            ),
                                        );
                                    },
                                ),
                                IconButton(
                                    onPressed: widget.onReload,
                                    icon: const Icon(
                                        Icons.refresh,
                                        color: Colors.white,
                                    ),
                                ),
                            ],
                        ),
                    ),
                    ...widget.data.map((exercise) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: BottomSheetDummyUI(
                                exercise: exercise,
                                user: widget.user,
                                onDelete: () async {
                                    final borrarEjer = BorrarEjer();
                                    await borrarEjer.borrar(widget.user, exercise);
                                    widget.onReload();
                                },
                            ),
                        );
                    }).toList(),
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                            children: [
                                ElevatedButton(
                                    onPressed: () async {
                                        final newName = await rutineName(context);
                                        if (newName != null && newName.isNotEmpty) {
                                            widget.nameNotifier.value = newName;
                                        }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.redAccent,
                                        minimumSize: const Size(double.infinity, 50),
                                    ),
                                    child: const Text(
                                        'Asignar nombre a la rutina',
                                        style: TextStyle(color: Colors.white),
                                    ),
                                ),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                    onPressed: () async {
                                        final subirFinal = Final();
                                        await subirFinal.subirRutina(context, widget.user, widget.data, widget.nameNotifier.value);
                                        final borrarTemporal = Borrar();
                                        borrarTemporal.BorrarEjers(widget.user);
                                        Navigator.pushReplacementNamed(context, MyRoutes.inicio.name, arguments: widget.user);
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
                            ],
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
                        onPressed: onDelete,
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

Future<String?> rutineName(BuildContext context) async {
    TextEditingController controllername = TextEditingController();
    String? name;

    await showDialog<String>(
        context: context,
        builder: (context) {
            return AlertDialog(
                title: const Text('Nombre de la rutina'),
                content: TextField(
                    controller: controllername,
                    decoration: const InputDecoration(
                        hintText: 'Nombre de la rutina',
                    ),
                    maxLength: 17, // Limita la longitud de entrada a 17 caracteres
                ),
                actions: [
                    TextButton(
                        onPressed: () {
                            Navigator.of(context).pop(null);
                        },
                        child: const Text('Cancelar'),
                    ),
                    TextButton(
                        onPressed: () {
                            if (controllername.text.length <= 17) {
                                name = controllername.text;
                                Navigator.of(context).pop(name);
                            } else {
                                showDialog(
                                      context: context,
                                      builder: (context) {
                                          return AlertDialog(
                                              title: const Text('Advertencia'),
                                              content: const Text('El valor maximo como nombre de rutina no debe exceder los 17 caracteres'),
                                              actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                          Navigator.pop(context);
                                                      },
                                                      child: const Text('Aceptar'),
                                                  ),
                                              ],
                                          );
                                      },
                                  );
                            }
                        },
                        child: const Text('Aceptar'),
                    ),
                ],
            );
        },
    );

    return name;
}

