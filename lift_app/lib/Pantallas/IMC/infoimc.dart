
// ignore_for_file: library_private_types_in_public_api, prefer_interpolation_to_compose_strings, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';

class IMCinfo extends StatefulWidget {
  const IMCinfo({Key? key}) : super(key: key);

  @override
  _IMCinfo createState() => _IMCinfo();
}

class _IMCinfo extends State<IMCinfo> {
  
  final _formKey = GlobalKey<FormState>();
  final storage = FirebaseStorage.instance.ref();

  final pesoController = TextEditingController(text: '',);
  final alturaController = TextEditingController(text: '');
  final fechaController = TextEditingController(text: '');


  @override
  Widget build(BuildContext context) {
        final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final user = arguments['user'];
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
                title: Text('Calcula Tu IMC '+ user, style: const TextStyle(fontWeight:FontWeight.bold),),
                backgroundColor: Colors.redAccent,
                actions: [
                  IconButton(onPressed: () {
  Navigator.pushReplacementNamed(context, MyRoutes.inicio.name,
                  arguments: user);                  },icon: const Icon(Icons.logout),)
                ],
            ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(style: const TextStyle(color: Colors.white),
                  controller: pesoController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Peso En KG',
                    hintText: 'Peso en Kilogramos',
                    labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w400)

                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese el peso';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(style: const TextStyle(color: Colors.white),
                  controller: alturaController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Estatura En Metros',
                    hintText: 'Estatura En Metros',
                    labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),
                    

                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su Estatura';
                    }
                    return null;
                  },
                ),
               
                const SizedBox(height: 16.0),
                TextFormField(style: const TextStyle(color: Colors.white),
                  controller: fechaController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Fecha (Referencia)',
                    hintText: 'Indique Fecha o Cuando Se Realizo Dicho Calculo',
                    labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w400)
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese la informacion indicada';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    final instance = FirebaseFirestore.instance;

                    if (_formKey.currentState!.validate()) {

                     double p = double.parse(pesoController.text);
                     double a = double.parse(alturaController.text);

                      double imc = p /(a*a);
                      String imcRedondeado = imc.toStringAsFixed(2);
                      double imcFinal = double.parse(imcRedondeado);
                        final data = {
                            'Peso': pesoController.text,
                            'Fecha': fechaController.text,
                            'estatura' : alturaController.text,
                            'imc' : imcFinal,
                            'name': user
                        };

                        await instance.collection('IMC').add(data);
                        Navigator.pushReplacementNamed(context, MyRoutes.stats.name, arguments: {'user': user});
                    
                    }
                  },
                  child: const Text('Calcular'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}