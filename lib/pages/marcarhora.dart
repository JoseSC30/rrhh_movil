import 'package:flutter/material.dart';
import 'package:si2_rrhh_movil_prueba/main.dart';
import 'package:si2_rrhh_movil_prueba/pages/comunicados.dart';
import 'package:si2_rrhh_movil_prueba/pages/miperfil.dart';
import 'package:si2_rrhh_movil_prueba/pages/permisos.dart';
import 'package:si2_rrhh_movil_prueba/pages/sueldos.dart';

class MarcaHora extends StatefulWidget {
  const MarcaHora({super.key});

  @override
  State<MarcaHora> createState() => _MarcaHoraState();
}

class _MarcaHoraState extends State<MarcaHora> {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material Appp',
      home: Scaffold(
        drawer: Drawer(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  // width: 100,
                  // height: 100,
                  margin: const EdgeInsets.all(50),
                  // child: Image.asset("images/rrhh_logo_persona.png"),
                  // child: Color.,
                ),
                const Text(
                  "RECURSOS HUMANOS",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Mi Perfil'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MiPefil()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.insert_comment_rounded),
                  title: Text('Comunicados'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Comunicados()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.money),
                  title: Text('Pagos'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Sueldos()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.timer_sharp),
                  title: Text('Marcar Hora'),
                  onTap: () {
                     Navigator.push(context,
                         MaterialPageRoute(builder: (context) => MarcaHora()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.thumb_up_outlined),
                  title: Text('Solicitar Permisos'),
                  onTap: () {
                     Navigator.push(context,
                         MaterialPageRoute(builder: (context) => Permisos()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Cerrar Sesión'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                ),
                Expanded(child: Container()),
                OutlinedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage()));
                    },
                    icon: Icon(
                      Icons.exit_to_app,
                      size: 18,
                    ),
                    label: Text("Cerrar Sesión")),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Text('Marcar Hora'),
          backgroundColor: Color.fromARGB(255, 52, 182, 189),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [           
              const ListTile(
                leading: Icon(Icons.access_time_outlined, color: Colors.black),
                title: Text(
                  '08:36h Jueves, 3 de Septiembre',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                subtitle: Text('Turno de mañana (8:00h / 14:00h)', style: TextStyle(fontSize: 20),),
              ),

               OutlinedButton(
              onPressed: (){}, 
              child: Text('              COMENZAR REGISTRO              ', 
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 15),),
              style: OutlinedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 52, 182, 189),
                maximumSize: Size(300, 70)
              )
              ),

               const ListTile(
                title: Text(
                  'Estado: Pendiente',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: Colors.red,)
                ),
              ),

              Container(
              padding: EdgeInsets.all(7),
              ),

               const ListTile(
                title: Text(
                  'PERIODOS REGISTRADOS',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),

              const ListTile(
                leading: Icon(Icons.check_box_outlined),
                title: Text(
                  'AGOSTO - 2022',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                subtitle: Text('Total Registro en: 31'),
              ),
              const ListTile(
                leading: Icon(Icons.check_box_outlined),
                title: Text(
                  'JULIO - 2022',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                subtitle: Text('Total Registro en: 29'),
              ),
              const ListTile(
                leading: Icon(Icons.check_box_outlined),
                title: Text(
                  'JUNIO - 2022',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                subtitle: Text('Total Registro en: 25'),
              ),        const ListTile(
                leading: Icon(Icons.check_box_outline_blank_rounded),
                title: Text(
                  'MAYO - 2022',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                subtitle: Text('Total Registro en: 0'),
              ),                       
            ],
          ),
        ),
      ),
    );
  }
}