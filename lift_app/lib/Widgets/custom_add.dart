
import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);

// ignore: must_be_immutable
class Customadd extends StatefulWidget {
 const Customadd({
    Key? key,
    //required this.controller,
    this.widget,
    this.suffixIcon,
    this.tamMax,
    this.bordes,
    required this.hint,
  }) : super(key: key);

  //final TextEditingController controller;
  final Widget? suffixIcon;
  final int? tamMax;
  final InputBorder? bordes;
  final String hint;
  final Widget? widget;

  @override
  State<Customadd> createState() => _CustomInputState();
}

class _CustomInputState extends State<Customadd> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            readOnly: widget.widget != null ? true:false,
            autofocus: false,
            //controller: widget.controller,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: widget.hint,
              border: widget.bordes,
            ),
          ),
        ),
        widget.widget ==null? Container():Container(child: widget.widget)
      ],
    );
  }
}