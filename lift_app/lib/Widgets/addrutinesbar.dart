import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lift_app/Temas/temas.dart';

addRutinebar(BuildContext context) {
    
    String formatedate = DateFormat('MMMM d, y', 'es').format(DateTime.now());
    
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(formatedate, style: subtituloStyle),
                        Text('Hoy', style: tituloStyle),
                    ],
                ),
            ],
        ),
    );
}
