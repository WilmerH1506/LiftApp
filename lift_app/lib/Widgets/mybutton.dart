import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  const Mybutton({super.key,required this.label,required this.onTap});

  final String label;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Flexible(
            child: Text(label,style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),),
          ),
        )
      )
    );
  }
}