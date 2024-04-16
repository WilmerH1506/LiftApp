import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Validaciones/validaciones_registro.dart';
import 'package:lift_app/Widgets/custom_input.dart';

// ignore: must_be_immutable
class Registro extends StatelessWidget {
const  Registro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 82, 71, 123),
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
        backgroundColor: const Color.fromARGB(255, 82, 71, 123),
      ),
      body: SingleChildScrollView(
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
                            onPressed: () async {
                              await onPressedRegistro(context);
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

