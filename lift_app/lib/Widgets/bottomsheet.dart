import 'package:flutter/material.dart';
import 'package:lift_app/Widgets/bsdborrar.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Widgets/bsdFinal.dart';

class Bottom extends StatelessWidget {
  final List<String> data;
  final String user;

  const Bottom({super.key, required this.data, required this.user});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Rutina actual',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ...data.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: BottomSheetDummyUI(data: item),
            );
          }).toList(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                 final subirFinal = Final();
                 subirFinal.subirRutina(user, data);
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
  final String data;

  const BottomSheetDummyUI({super.key, required this.data});

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ],
      ),
    );
  }
}
