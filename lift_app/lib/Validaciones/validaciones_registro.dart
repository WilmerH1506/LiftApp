import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

 final usuarioController = TextEditingController();
  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseFirestore bds = FirebaseFirestore.instance;
  
  
  String? usuarioValidator(value) {   //Validacion del campo de texto del usuario
                            if (value!.isEmpty) {
                              return 'El campo Usuario es obligatorio';
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
                  ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('El nombre de usuario ya está en uso')),
                   );
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
          ScaffoldMessenger.of(context).showSnackBar(
                   const SnackBar(content:Text('Usuario Registrado'))
             );
             usuarioController.clear();
             passwordController.clear();
             confirmPasswordController.clear();
             emailController.clear();
             nombreController.clear();
            }
      }
      else
      {
         ScaffoldMessenger.of(context).showSnackBar(
                   const SnackBar(content:Text('Las contraseñas no coinciden'))
             );
      }    
    }
  }                      