
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lift_app/Variables_Globales/var_seleddate.dart';
import 'package:lift_app/Widgets/getgatefromuser.dart';


addDatebar(){
  DateTime selectedDate = DateTime.now();
  final micontroller = Get.put(MiController());
  return Container(
            margin: const EdgeInsets.only(top: 20,left: 20),
            child: DatePicker(
              DateTime.now(),
              height: 100,
              width: 80,
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.redAccent,
              selectedTextColor: Colors.white,
              dateTextStyle: GoogleFonts.lato(
                textStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.w600
              )
              ),
              dayTextStyle: GoogleFonts.lato(
                textStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w600
              )
              ),
              monthTextStyle: GoogleFonts.lato(
                textStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w600
              )
              ),
              onDateChange: (date) {
                micontroller.selectedDate1 = DateFormat.yMd().format(date);
                print(micontroller.selectedDate1 );
                setState(() {
                  selectedDate = date;
                });
                
              },
            ),
    );
}
