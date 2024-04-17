import 'package:flutter/material.dart';

class Board extends StatelessWidget {
  const Board({super.key,required this.titulo, this.ontap});

  final String titulo;
  final Function? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap as void Function()?,
      child: Container(
         decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blueGrey,
              ),
              height: 180,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 20, left: 20),
              child: Text(titulo),
      ),
    );
  }
}