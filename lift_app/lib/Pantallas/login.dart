import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Validaciones/validaciones_login.dart';
import 'package:lift_app/Widgets/custom_input.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;

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
      body: Stack(
        children: [
          SingleChildScrollView(
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
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text('Olvidaste tu contraseña?'),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: _isLoading ? null : () async {
                                    setState(() {
                                      _isLoading = true;
                                    });

                                    await onPressedLogin(context);
  
                                    setState(() {
                                      _isLoading = false;
                                    });
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


 void credencialesIncorrectas(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Error de Log in'),
        content: const Text('Las credenciales ingresadas so incorrectas'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Aceptar'),
          ),
        ],
      );
    },
  );
} 
