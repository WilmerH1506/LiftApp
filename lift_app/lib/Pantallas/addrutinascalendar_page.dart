import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lift_app/Widgets/custom_add.dart';

class AddRuntineCalendar extends StatefulWidget {
  const AddRuntineCalendar({super.key});

  @override
  State<AddRuntineCalendar> createState() => _AddRuntineCalendarState();
}

class _AddRuntineCalendarState extends State<AddRuntineCalendar> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar rutina al calendario'),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
            Customadd( hint: DateFormat.yMd().format(selectedDate),
            suffixIcon: IconButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2025),
                ).then((date) {
                  if (date != null && date != selectedDate) {
                    setState(() {
                      selectedDate = date;
                    });
                  }
                });
              },
             icon: const Icon(Icons.calendar_today_outlined) ,),
              bordes: const OutlineInputBorder(),)
            ],),
        ),
      ),
    );
  }
}