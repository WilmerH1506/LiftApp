// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

 getDateFromUser(BuildContext context) async {
  DateTime selectedDate = DateTime.now();
  String confirmTextdate = "";
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime(DateTime.now().year + 10),
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    } else {
      return;
    }
    confirmTextdate = "Confirmar";
  }
  
  void setState(Null Function() param0) {
  }