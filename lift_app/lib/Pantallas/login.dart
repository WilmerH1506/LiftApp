import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

typedef Validator = String? Function(String?);


// ignore: must_be_immutable
class CustomInput extends StatefulWidget {
  CustomInput({
    Key? key,
    required this.controller,
    required this.validator,
    required this.obscureText,
    required this.labelText,
    required this.prefixIcon,
    this.suffixIcon,
    this.tamMax,
    this.bordes,
  }) : super(key: key);

  final TextEditingController controller;
  bool obscureText;
  final String labelText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final Validator validator;
  final int? tamMax;
  final InputBorder? bordes;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.text,
      obscureText: widget.obscureText,
      validator: widget.validator,
      maxLength: widget.tamMax,
      decoration: InputDecoration(
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon != null
            ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
                icon: widget.obscureText
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              )
            : null,
        border: widget.bordes,
      ),
    );
  }
}
