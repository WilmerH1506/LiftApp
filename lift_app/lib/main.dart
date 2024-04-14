import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lift App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 83, 72, 122)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final usuarioController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Iniciar Sesión',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 83, 72, 122),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.6,
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
                          const SizedBox(height: 30),
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
                          const SizedBox(height: 15),
                          const Row(
                            children: [
                              Text(
                                'Olvidaste tu contraseña?',
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                          const SizedBox(height: 30),
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
                                    const SnackBar(content: Text('El email o la contraseña son incorrectos')),
                                  );
                                }
                              }
                            },
                            child: const Text('Iniciar sesión'),
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
    );
  }
}

typedef Validator = String? Function(String?);

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
