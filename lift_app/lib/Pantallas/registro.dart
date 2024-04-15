import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';

class Registro extends StatelessWidget {
  Registro({Key? key}) : super(key: key);

  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 95, 84, 135),
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
        backgroundColor: const Color.fromARGB(255, 95, 84, 135),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.90,
          height: MediaQuery.of(context).size.height * 0.76,
          margin: const EdgeInsets.only(left: 20, top: 40),
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'El campo Usuario es obligatorio';
                              }
                              return null;
                            },
                            obscureText: false,
                            labelText: 'Nombre Usuario',
                            prefixIcon: const Icon(Icons.person),
                            bordes: const OutlineInputBorder(),
                          ),
                          const SizedBox(height: 5,),
                          CustomInput(
                            controller: nombreController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'El campo Nombres es obligatorio';
                              }
                              return null;
                            },
                            obscureText: false,
                            labelText: 'Nombres',
                            prefixIcon: const Icon(Icons.person),
                            bordes: const OutlineInputBorder(),
                          ),
                          const SizedBox(height: 5,),
                          CustomInput(
                            controller: apellidoController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'El campo Apellidos es obligatorio';
                              }
                              return null;
                            },
                            obscureText: false,
                            labelText: 'Apellidos',
                            prefixIcon: const Icon(Icons.person),
                            bordes: const OutlineInputBorder(),
                          ),
                          const SizedBox(height: 5,),
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
                          const SizedBox(height: 5,),
                          CustomInput(
                            controller: confirmPasswordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'El campo contraseña es obligatorio';
                              }
                              return null;
                            },
                            obscureText: true,
                            labelText: 'Confirmar',
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: const Icon(Icons.visibility),
                            bordes: const OutlineInputBorder(),
                          ),
                          const SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () {
                              final email = usuarioController.text;
                              final password = passwordController.text;

                              if (formKey.currentState!.validate()) {
                                if ((email == 'wyhernandezr@unah.hn' && password == '20222001369') ||
                                    (email == 'cdmontoyaa@unah.hn' && password == '20222001250')) {
                                  // Hacer algo si las credenciales son correctas
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('El Usuario o la contraseña son incorrectos')),
                                  );
                                }
                              }
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
