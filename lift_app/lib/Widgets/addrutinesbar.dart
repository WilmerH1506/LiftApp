
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Temas/temas.dart';
import 'package:lift_app/Widgets/mybutton.dart';

addRutinebar(BuildContext context) {
    String formatedate= DateFormat('MMMM d, y','es').format(DateTime.now());
  return Container(
            margin: const EdgeInsets.only(left: 20,top: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(formatedate,  style: subtituloStyle),
                     Text('Hoy', style:tituloStyle),
                  ],
                ),
                Mybutton(
                  label: 'Agregar rutina al calendario',
                   onTap: (){
                       Navigator.pushNamed(context,MyRoutes.addrutineCalendar.name);
                   })
              ],
            ),
          );
}
