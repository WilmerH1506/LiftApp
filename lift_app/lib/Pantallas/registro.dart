// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Validaciones/validaciones_registro.dart';
import 'package:lift_app/Widgets/custom_input.dart';

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 45, 43, 53),
      appBar: AppBar(
        title: const Text(
          'Registro',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, MyRoutes.login.name);
          },
          color: Colors.white,
          icon: const Icon(Icons.exit_to_app),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 45, 43, 53),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.90,
              height: MediaQuery.of(context).size.height * 0.80,
              margin: const EdgeInsets.only(left: 20, top: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(3, 3),
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
                          'Unete a nuestra comunidad!',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 15),
                        Form(
                            key: formKey,
                            child: Column(
                                children: [
                                  CustomInput(
                                    controller: usuarioController,
                                    validator: usuarioValidator,
                                    obscureText: false,
                                    labelText: 'Nombre Usuario',
                                    prefixIcon: const Icon(Icons.person),
                                    bordes: const OutlineInputBorder(),
                                  ),
                                  const SizedBox(height: 10,),
                                  CustomInput(
                                    controller: nombreController,
                                    validator: nombreValidator,
                                    obscureText: false,
                                    labelText: 'Nombres',
                                    prefixIcon: const Icon(Icons.person),
                                    bordes: const OutlineInputBorder(),
                                  ),
                                  const SizedBox(height: 10,),
                                  CustomInput(
                                    controller: emailController,
                                    validator: emailValidator,
                                    obscureText: false,
                                    labelText: 'Email',
                                    prefixIcon: const Icon(Icons.email),
                                    bordes: const OutlineInputBorder(),
                                  ),
                                  const SizedBox(height: 10),
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
                                  CustomInput(
                                    controller: confirmPasswordController,
                                    validator: confirmPasswordValidator,
                                    obscureText: true,
                                    labelText: 'Confirmar',
                                    prefixIcon: const Icon(Icons.lock),
                                    suffixIcon: const Icon(Icons.visibility),
                                    bordes: const OutlineInputBorder(),
                                  ),
                                  const SizedBox(height: 15),
                                  ElevatedButton(
                                    onPressed: _isLoading ? null : () async {
                                      setState(() {
                                        _isLoading = true;
                                      });
                                        
                                      await onPressedRegistro(context);

                                      setState(() {
                                        _isLoading = false;
                                      });
                                    },
                                    child: const Text('Registrarte'),
                                  ),
                                ]
                            )
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}


