
import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);

// ignore: must_be_immutable
class Customadd extends StatefulWidget {
 const Customadd({
    Key? key,
    //required this.controller,
    this.widget,
    this.suffixIcon,
    required this.title,
    this.tamMax,
    required this.hint,
  }) : super(key: key);

  //final TextEditingController controller;
  final Widget? suffixIcon;
  final int? tamMax;
  final String hint;
  final Widget? widget;
  final String title;

  @override
  State<Customadd> createState() => _CustomInputState();
}

class _CustomInputState extends State<Customadd> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.title,
              style: const TextStyle(color: Colors.white ,fontSize: 20) ,
            ),
          ],
        ),
        Container(
          height: 52,
          margin: const EdgeInsets.only(top: 4),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
              ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  readOnly: widget.widget != null ? true:false,
                  autofocus: false,
                  //controller: widget.controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: widget.hint ,hintStyle:const TextStyle(color: Colors.white),
                    border: InputBorder.none,
                  ),
                ),
              ),
              widget.widget ==null? Container():Container(child: widget.widget)
            ],
          ),
        ),
      ],
    );
  }
}