

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Variables_Globales/var_seleddate.dart';
import 'package:lift_app/Widgets/addrutinesbar.dart';


class PerfilPage extends StatefulWidget {
 const PerfilPage({Key? key}) : super(key: key);

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  FirebaseFirestore instance = FirebaseFirestore.instance;

   final micontroller = Get.put(MiController());

  @override
  Widget build(BuildContext context) {
    final  user = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
       title: Text(user,style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),),
          actions: [IconButton(
            onPressed: () {
            Navigator.pushReplacementNamed(context,MyRoutes.login.name);
            },
            icon: const Icon(Icons.logout),
            
          )],
       backgroundColor: Colors.redAccent,
      ),
    
      body:
       Column(
        children: [
          addRutinebar(context),
          addDatebar(),
          showAgenda(),
        ],
        )
        
        
      );
  }

addDatebar(){
  DateTime selectedDate = DateTime.now();
  final micontroller = Get.put(MiController());
  DatePickerController? controllerDate;
  return Container(
            margin: const EdgeInsets.only(top: 20,left: 20),
            child: DatePicker(
              controller: controllerDate,
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
                  showAgenda();
                  selectedDate = date;
                }); 
              },
            ),
    );
}

  showAgenda(){
     final agenda = instance.collection('Agenda').snapshots();
    return StreamBuilder(
      stream: agenda,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
              final listagenda = snapshot.data!.docs;
              agenlist.value = listagenda;
        return Expanded(
        child: Obx((){
          return ListView.builder(
            itemCount: agenlist.length,
            itemBuilder: (BuildContext context, int index) {
              final agenda = agenlist[index];
              final fecha = micontroller.selectedDate1;
            if(agenda['date'] == fecha){
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                 child: SlideAnimation(
                  child: FadeInAnimation(
                    child:GestureDetector(
                      onTap: () {
                        showBottomSheet(context , agenda);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(top: 20,left: 20,right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white ,
                          borderRadius: BorderRadius.circular(10),
                        ),
                    
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(agenda['name'],style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(agenda['startTime'],style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                                ), 
                                ),
                                const Text(' - ',style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                                ),),
                                Text(agenda['endTime'],style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                                ),),
                              ],
                            ), 
                            const SizedBox(height: 10),
                            Text(agenda['date'],style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),
                            ),
                          ],
                      ),
                    ) 
                    ,)
                     ,)
                     )
                      );
           } 
            else{
              return Container();
              }
            },
          );
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

  showBottomSheet(BuildContext context, agenda) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.24,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: 120,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[300],
                ),
                child: const Text('     Rutina Completa     '),
               
              ),
               const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[300],
                ),
                child: const Text('      Eliminar Rutina      '),
              ),
            ],
          ),
        );
      },
    );
  }
}


