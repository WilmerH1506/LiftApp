import 'package:flutter/material.dart';

class Board extends StatelessWidget {
  const Board({super.key,required this.titulo, this.ontap, this.imagen});

  final String titulo;
  final Function? ontap;
  final Image? imagen;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap as void Function()?,
      child: Container(
         decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.redAccent,
              ),
              height: 90,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 20, left: 20),
              child: Row(
                children: [
                  if (imagen != null)
                  Padding(
                padding: const EdgeInsets.only(left: 20),
                child: 
                      CircleAvatar(
                        backgroundImage: imagen?.image,
                        radius: 30,
                      )
                  ),
                   const SizedBox(width: 30,),
                   Text(
                          titulo,
                          style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                      ),
                ],
              ),
      ),
    );
  }
}