import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lift_app/Widgets/custom_input.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseFirestore bds = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 82, 71, 123),
      appBar: AppBar(
        title: const Text(
          'Iniciar Sesión',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 82, 71, 123),
      ),
      body: SingleChildScrollView( 
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.height * 0.56,
            margin: const EdgeInsets.only(left: 2.5, top: 100),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(3, 3), // Cambia la sombra si lo deseas
                ),
              ],
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        'Bienvenido De Vuelta!',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 30),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            CustomInput(
                              controller: usuarioController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'El campo email es obligatorio';
                                }
                                if (!value.contains('@')) {
                                  return 'El email no es válido';
                                }
                                if (value.length < 6) {
                                  return 'El email debe tener al menos 6 caracteres';
                                }
                                if (!value.contains('.')) {
                                  return 'El email no es válido';
                                }
                                return null;
                              },
                              obscureText: false,
                              labelText: 'Usuario',
                              prefixIcon: const Icon(Icons.person),
                              bordes: const OutlineInputBorder(),
                            ),
                            const SizedBox(height: 15),
                            CustomInput(
                              controller: passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'El campo contraseña es obligatorio';
                                }
                                if (value.length < 6) {
                                  return 'La contraseña debe tener al menos 6 caracteres';
                                }
                                return null;
                              },
                              obscureText: true,
                              labelText: 'Contraseña',
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: const Icon(Icons.visibility),
                              bordes: const OutlineInputBorder(),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                  TextButton(onPressed: () {}, 
                                             child: const Text('Olvidaste tu contraseña?')
                                 ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                final usuario = usuarioController.text.trim();
                                final password = passwordController.text.trim();

                                if (formKey.currentState!.validate()) 
                                {
                                   final queryUser = await bds.collection('Usuarios').where('usuario', isEqualTo: usuario).get();
                                   final queryPass = await bds.collection('Usuarios').where('password', isEqualTo: password).get();

                                   if (queryUser.docs.isNotEmpty && queryPass.docs.isNotEmpty)
                                   {
                                       Navigator.pushReplacementNamed(context, MyRoutes.inicio.name);
                                   }
                                   else
                                   {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text('Las credenciales ingresadas son incorrectas'))
                                      );
                                   }
                                }
                              },
                              child: const Text('Iniciar sesión'),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Text('No tienes una cuenta?', style: TextStyle(fontSize: 13)),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(context, MyRoutes.registro.name);
                                  },
                                  child: const Text(
                                    'Registrate',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


