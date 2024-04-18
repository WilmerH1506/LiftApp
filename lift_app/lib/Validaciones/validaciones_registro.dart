import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';


 final usuarioController = TextEditingController();
  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseFirestore bds = FirebaseFirestore.instance;
  
  
  String? usuarioValidator(value) 
                         {   //Validacion del campo de texto del usuario
                            if (value!.isEmpty) {
                              return 'El campo Usuario es obligatorio';
                            }

                            if (value.length < 4) {
                              return 'El Usuario debe tener al menos 4 caracteres';
                            }
                            
                            return null;
                          }

  String? nombreValidator(value) {   //Validacion del campo de texto del nombre
                            if (value!.isEmpty) {
                              return 'El campo Nombres es obligatorio';
                            }
                            return null;
                          }

  String? emailValidator(value) {    //Validacion del campo de texto del email
                            if (value!.isEmpty) 
                            {
                              return 'El campo Email es obligatorio';
                            }
                           if (!value.contains('@') || !value.contains('.')) 
                          {
                            return 'El formato del correo electrónico es incorrecto';
                          }
                          if (value.length < 6){
                            return 'El correo debe tener al menos 6 caracteres';
                          }
                            return null;
                          }

  String? passwordValidator(value) {    //Validacion del campo de texto de la contraseña
                            if (value!.isEmpty) {
                              return 'El campo contraseña es obligatorio';
                            }

                            if (value.length < 6)
                            {
                              return 'Su contraseña debe contener 6 caracteres';
                            }
                            return null;
                          }

  String? confirmPasswordValidator(value) {     //Validacion del campo de texto de la confirmacion de la contraseña
                            if (value!.isEmpty) 
                            {
                              return 'El campo contraseña es obligatorio';
                            }
                            return null;
                          } 

Future<void> onPressedRegistro(BuildContext context) async {    //validacion del boton de registro                   
    final usuario = usuarioController.text.trim();
    final password = passwordController.text.trim();
    final comparar = confirmPasswordController.text.trim();
    final nombre = nombreController.text.trim();
    final email = emailController.text.trim();
    
                          
    if (formKey.currentState!.validate()) 
    {
      
      if (comparar == password)
      {
             final query = await bds.collection('Usuarios').where('usuario', isEqualTo: usuario)
             .get();
             
             if (query.docs.isNotEmpty)
             {
                 usuarioExistente(context);
             }
            else
            {
                     final data = 
                    {
                        'usuario': usuario,
                        'nombre': nombre,
                        'correo': email,
                        'password': password
                    };
            await bds.collection('Usuarios').add(data);
            usuarioAgregado(context);
             usuarioController.clear();
             passwordController.clear();
             confirmPasswordController.clear();
             emailController.clear();
             nombreController.clear();
            Navigator.pushReplacementNamed(context, MyRoutes.inicio.name);
            }
      }
      else
      {
         contrasenaNo(context);
      }    
    }
  }                      



 void usuarioExistente(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Error de Registro'),
        content: const Text('El usuario ya existe. Por favor, elige otro nombre de usuario.'),
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


 void usuarioAgregado(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Informacion'),
        content: const Text('Usuario Agregado con exito.'),
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

void contrasenaNo(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Error'),
        content: const Text('Las contraseñas no concuerdan'),
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
