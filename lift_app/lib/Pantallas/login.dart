import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Validaciones/validaciones_login.dart';
import 'package:lift_app/Widgets/custom_input.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
 const Login({Key? key}) : super(key: key);
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
                              validator: usuarioValidator,
                              obscureText: false,
                              labelText: 'Usuario',
                              prefixIcon: const Icon(Icons.person),
                              bordes: const OutlineInputBorder(),
                            ),
                            const SizedBox(height: 15),
                            CustomInput(
                              controller: passwordController,
                              validator: passwordValidator,
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
                                await onPressedLogin(context);
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


