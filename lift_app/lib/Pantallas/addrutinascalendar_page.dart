import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:lift_app/Temas/temas.dart';
import 'package:lift_app/Widgets/custom_add.dart';
import 'package:lift_app/Widgets/mybutton.dart';

class AddRuntineCalendar extends StatefulWidget {
  const AddRuntineCalendar({super.key});

  @override
  State<AddRuntineCalendar> createState() => _AddRuntineCalendarState();
}

class _AddRuntineCalendarState extends State<AddRuntineCalendar> {
  DateTime selectedDate = DateTime.now();
  String endTime = "9:30 PM";
  String startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20, 25, 30];

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
              Customadd(
                hint: DateFormat.yMd().format(selectedDate),
                widget: IconButton(
                  onPressed: () {
                    getDateFromUser(context);
                  },
                  icon: const Icon(Icons.calendar_today_outlined),
                ),
                bordes: const OutlineInputBorder(),
              ),
              Row(
                children: [
                  Expanded(
                    child: Customadd(
                        hint: startTime,
                        bordes: const OutlineInputBorder(),
                        widget: IconButton(
                          onPressed: () {
                            showPickerStart();
                          },
                          icon: const Icon(Icons.access_time_rounded),
                        )),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Customadd(
                        hint: endTime,
                        bordes: const OutlineInputBorder(),
                        widget: IconButton(
                          onPressed: () {
                            showPickerend();
                          },
                          icon: const Icon(Icons.access_time_rounded),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButtonFormField<int>(
                value: selectedRemind,
                items: remindList
                    .map((e) => DropdownMenuItem(
                          child: Text("$e minutos antes"),
                          value: e,
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedRemind = value;
                    });
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Agregar rutina",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  getDateFromUser(BuildContext context) async {
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
  }

  void showPickerStart() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      if (value != null) {
        final now = DateTime.now();
        var selectedTime =
            DateTime(now.year, now.month, now.day, value.hour, value.minute);

        if (selectedDate != DateTime.now()) {
          setState(() {
            startTime = DateFormat("hh:mm a").format(selectedTime).toString();
          });
        } else if (selectedTime.isAfter(DateTime.now())) {
          setState(() {
            startTime = DateFormat("hh:mm a").format(selectedTime).toString();
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Selecciona una hora válida"),
            backgroundColor: Colors.redAccent,
          ));
        }
      }
    });
  }

  void showPickerend() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      if (value != null) {
        final now = DateTime.now();
        var selectedTime =
            DateTime(now.year, now.month, now.day, value.hour, value.minute);

        if (selectedDate != DateTime.now()) {
          setState(() {
            endTime = DateFormat("hh:mm a").format(selectedTime).toString();
          });
        } else if (selectedTime.isAfter(DateTime.now())) {
          setState(() {
            endTime = DateFormat("hh:mm a").format(selectedTime).toString();
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Selecciona una hora válida"),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
      }
    });
  }
}
