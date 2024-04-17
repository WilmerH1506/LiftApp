
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lift_app/Routes/my_routes.dart';

final TextEditingController usuarioController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseFirestore bds = FirebaseFirestore.instance;
//Validaciones de los campos de texto

   String? usuarioValidator(value) //validacion del campo de texto del usuario
   {
     if (value!.isEmpty) {
       return 'El campo Usuario es obligatorio';
     }
    
      return null;
   }
  
 String? passwordValidator(value) //Validacion del campo de texto de la contraseña
  {
     if (value!.isEmpty) {
      return 'El campo contraseña es obligatorio';
     }
     if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
     }
      return null;
  }


  Future<void> onPressedLogin(BuildContext context) async { //validacion del boton de inicio de sesion
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
                const SnackBar(content: Text('Las credenciales ingresadas no son incorrectas'))
          );
       }
    }
  }
