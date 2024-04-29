import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Widgets/custom_add.dart';

class AddRuntineCalendar extends StatefulWidget {
  const AddRuntineCalendar({super.key});
  
  @override
  State<AddRuntineCalendar> createState() => _AddRuntineCalendarState();
}

class _AddRuntineCalendarState extends State<AddRuntineCalendar> {

  DateTime selectedDate = DateTime.now();
  String endTime = "9:30 PM";
  String startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
   final instance = FirebaseFirestore.instance;
   String? confirmTextdate= "";
   String? confirmTextendTime= "";
   String? confirmTextstartTime= "";
 
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final user = arguments['user'];
    final name = arguments['name'];



    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Agregar rutina al calendario'),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(onPressed: () {
    Navigator.pushReplacementNamed(context, MyRoutes.rutinas.name, arguments: {'user': user, 'name': name});
          },icon: const Icon(Icons.logout),)
        ],
        
      ),
      body: Column(
        children: [
          comandHora(context),
          const SizedBox(
            height: 10,
          ),
          showwk(),
        ],
      )
    );
  }

  Container comandHora(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final user = arguments['user'];
    final name = arguments['name'];
    final workouts = instance.collection('Rutina Final').where('name', isEqualTo: name).snapshots();

    return Container(
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
                icon: const Icon(Icons.calendar_today_outlined,
                  color: Colors.white,),
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
                        icon: const Icon(Icons.access_time_rounded,
                          color: Colors.white,),
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
                        icon: const Icon(Icons.access_time_rounded,
                          color: Colors.white,) ,
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
            ElevatedButton(
              onPressed: () async{
                final data = {
                  "date": DateFormat.yMd().format(selectedDate),
                  "startTime": startTime,
                  "endTime": endTime,
                  "name": name,
                  "user": user,
                };

                if(confirmTextdate !="Confirmar"|| confirmTextstartTime !="Confirmar" || confirmTextendTime !="Confirmar"){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Todos los campos son obligatorios"),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                  return;
                }

               final respuesta = await instance.collection("Agenda").add(data);

               confirmTextdate = "";
               confirmTextstartTime = "";
               confirmTextendTime = "";

              print(respuesta);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Rutina agregada al calendario"),
                  backgroundColor: Colors.greenAccent,
                ),
              );
                Navigator.pushReplacementNamed(context, MyRoutes.rutinas.name, arguments: {'user': user, 'name': name});

              },
              child: const Text("Agregar a agenda",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
              Navigator.pushReplacementNamed(context, MyRoutes.rutinas.name, arguments: {'user': user, 'name': name});
            }, 
            child: const Text("Cancelar")),
          ],
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
        confirmTextdate = "Confirmar";
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
            confirmTextstartTime = "Confirmar";
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
            confirmTextendTime = "Confirmar";
          });
        } else if (selectedTime.isAfter(DateTime.now())) {
          setState(() {
            endTime = DateFormat("hh:mm a").format(selectedTime).toString();
            confirmTextendTime = "Confirmar";
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

    showwk(){
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final user = arguments['user'];
    final name = arguments['name'];
   final workouts = instance.collection('Rutina Final').where('name', isEqualTo: name).snapshots();
    return StreamBuilder(
      stream: workouts,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
              final listwk = snapshot.data!.docs;
        return Expanded(
        child:  ListView.builder(
            itemCount: listwk.length,
            itemBuilder: (BuildContext context, int index) {
              final wk = listwk[index];
              return GestureDetector(
                onTap: () {
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 20,left: 20,right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
              
                  child: Column(
                    children: [
                      Text(wk['name'],style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),),
                      const SizedBox(height: 10,),
                    ],
                ),
              ) 
              ,);
            }
          )
      );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      },
    );
  }
}
