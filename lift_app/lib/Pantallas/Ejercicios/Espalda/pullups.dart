import 'package:flutter/material.dart';
import 'package:lift_app/Widgets/agregargif.dart';
import 'package:lift_app/Routes/my_routes.dart';
import 'package:lift_app/Widgets/bsdtemporal.dart';


class PullUps extends StatelessWidget {
    const PullUps({Key? key}) : super(key: key);
   
  @override
  Widget build(BuildContext context) {
        final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      
        final user = arguments['user'];
        final name = arguments['name'];

    return MaterialApp(
      home: Scaffold( backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Row(
            children: [
               Text('Pull-Ups (Dominadas)',style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),),
          Icon(Icons.sports_gymnastics_sharp)
            ],
          ),
          backgroundColor: Colors.redAccent,
          actions: [IconButton(onPressed: () {
             Navigator.pushReplacementNamed(context, MyRoutes.menu_espalda.name, arguments: {
                                                'user': user,
                                                'name': name,
                                            });
          },
          icon: const Icon(Icons.logout),
          )],
        ),
        body:  SingleChildScrollView( 
        child: Column(
          children: [ 
             Padding(
              padding: const EdgeInsets.only(top: 20),
              
            child: Container(
              width: 500,
              height: 325,
              decoration:  BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.black26,
                  width: 5
                ),               
              ),
             child: FutureBuilder<Widget>(
                                        future: AggGif('Videos/pull ups.gif').getGifWidget(),
                                        builder: (context, snapshot) 
                                        {
                                            if (snapshot.connectionState == ConnectionState.waiting) 
                                            {
                                                return const Center(child: CircularProgressIndicator());
                                            }  
                                            else 
                                            {
                                                return snapshot.data!;
                                            }
                                        },
                                    ),
            ),           
            ),
           const  SizedBox(height: 25,),
         const Row(
            children: [
            Text(' Pull-Ups (Dominadas)',style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25
            ),),
            
            ],) ,
           const  SizedBox(height: 5,),
           const  Row(
              children: [
                SizedBox(width: 10,),
            Text('Primario: Dorsales, Deltoides, Trapecios',style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17
            ),),
              ],
            ),
                       const  SizedBox(height: 5,),
                       //Musculos
          const  Row(
              children: [
                SizedBox(width: 10,),
            Text('Secundario: Biceps, Romboides',style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 17
            ),),
              ],
            ) ,
             const SizedBox(height: 28,),
             //Niveles
             const Row(children: [
              SizedBox(width: 1,),
              Text('Principiante',style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
              SizedBox(width: 20,),
               Text('Intermedio',style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
               SizedBox(width: 20,),
                Text('Avanzado',style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
             ],),
             //Estrellas
            const SizedBox(height: 5,),
            const Row(children: [
             SizedBox(width: 53,),
             Icon(Icons.star,color: Colors.yellow,),
              SizedBox(width: 83,),
              Icon(Icons.star,color: Colors.yellow,),
              Icon(Icons.star,color: Colors.yellow,),
              SizedBox(width: 56,),
              Icon(Icons.star,color: Colors.yellow,),
              Icon(Icons.star,color: Colors.yellow,),
              Icon(Icons.star,color: Colors.yellow,)
             
             ],),
              //Sets
              const SizedBox(height: 36,),
              const Row(
                children: [
                  SizedBox(width: 1,),
                  Column(children: [
                    Text('    4 Sets',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15),),
                    SizedBox(height: 5,),
                    Text('    10 - 15',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15),),
                    SizedBox(height: 5,),
                    Text('      Repeticiones',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15),),

                  ],),
                  SizedBox(width: 5,),
                  Column(children: [
                    Text('   4 Sets',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15),),
                    SizedBox(height: 5,),
                    Text('   8 - 12',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15),),
                    SizedBox(height: 5,),
                    Text('     Repeticiones',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15),),

                  ],),
                  SizedBox(width: 17,),
                  Column(children: [
                    Text(' 4 Sets',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15),),
                    SizedBox(height: 5,),
                    Text(' 6 - 10',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15),),
                    SizedBox(height: 5,),
                    Text(' Repeticiones',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15),),

                  ],),
                ],),
                const SizedBox(height: 20,),
                const Row(children: [
                  Column(children: [
                    Text('**Nota: Debe elegir un peso el cual se sienta comodo realizandolo',
                    style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 11),),
                    Text('El peso debe ser el maximo posible que le permita realizar',
                    style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 11),),
                      Text('Con la mejor tecnica para mejores resultados',
                    style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 11),),
                  ],)
                ],),
               const  SizedBox(height: 40,),
                ElevatedButton(
                            onPressed: () {
                              final subir = Temporal();
                              subir.bsdTemporal(user, 'Pull Ups', name);
                                 Navigator.pushReplacementNamed(context, MyRoutes.crear_rutinas.name, arguments: {
                                                'user': user,
                                                'name': name,
                                            });
                            },
                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        minimumSize: const Size(250, 50),
                                      ),
                              child: const Text(
                                        'Agregar Rutina',
                                        style: TextStyle(color: Colors.white),
                                    ),
                                  )
               
          ],),       
        ),        
      ),
    );
  }
}
