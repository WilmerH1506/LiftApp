

// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Variables_Globales/var_seleddate.dart';
import 'package:lift_app/Widgets/addrutinesbar.dart';


class PerfilPage extends StatefulWidget {
final String user;
 const PerfilPage({Key? key, required this.user}) : super(key: key);

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
          actions: [
          IconButton(
            onPressed: () {
      Navigator.pushReplacementNamed(context, MyRoutes.stats.name, arguments: {'user': user});

            },
            icon: const Icon(Icons.query_stats,color: Colors.white,),
            
          ),
            IconButton(
            onPressed: () {
      Navigator.pushReplacementNamed(context, MyRoutes.imc.name, arguments: {'user': user});

            },
            icon: const Icon(Icons.person_4,color: Colors.white,),
            
          ),
          IconButton(onPressed: () async {
             bool? shouldLogout = await showDialog<bool>(
                                context: context,
                                builder: (context) {
                                    return AlertDialog(
                                        title: const Text('Confirmar cierre de sesión'),
                                        content: const Text('¿Estás seguro de que deseas cerrar Sesion?'),
                                        actions: [
                                            TextButton(
                                                onPressed: () {
                                                    Navigator.of(context).pop(false);
                                                },
                                                child: const Text('Cancelar'),
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                    Navigator.of(context).pop(true);
                                                },
                                                child: const Text('Confirmar'),
                                            ),
                                        ],
                                    );
                                },
                            );
                             if (shouldLogout == true) {
                                // ignore: use_build_context_synchronously
                                Navigator.pushReplacementNamed(context, MyRoutes.login.name, arguments: user);
                            }
          },icon: const Icon(Icons.logout,color: Colors.white,),)],
          
          
       backgroundColor: Colors.redAccent,
      ),
    
      body:
       Column(
        children: [
          addRutinebar(context),
          addDatebar(user),
          showAgenda(user),
        ],
        )
        
        
      );
  }

addDatebar(user){
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
                setState(() {
                  showAgenda(user);
                  selectedDate = date;
                }); 
              },
            ),
    );
}

  showAgenda(user){
    final agenda = instance.collection('Agenda').where('user', isEqualTo: user) .snapshots();

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
                          color: agenda['status'] == 'Completa' ? Colors.purple[400] : Colors.white,
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
          color: Colors.black,
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
                  setState(() {
                    instance.collection('Agenda').doc(agenda.id).update({'status': 'Completa'});
                  });
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                child: const Text('     Rutina Completa     ',style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),),
               
              ),
               const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  instance.collection('Agenda').doc(agenda.id).delete();
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text('      Eliminar Rutina      ',style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),),
              ),
            ],
          ),
        );
      },
    );
  }
}


