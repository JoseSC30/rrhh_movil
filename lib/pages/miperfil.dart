import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:si2_rrhh_movil_prueba/pages/comunicados.dart';
import 'package:si2_rrhh_movil_prueba/pages/sueldos.dart';
import 'package:si2_rrhh_movil_prueba/usuario.dart';

import '../main.dart';

class MiPefil extends StatefulWidget {
  const MiPefil({super.key});

  @override
  State<MiPefil> createState() => _MiPefilState();
}

class _MiPefilState extends State<MiPefil> {
  // get nombre => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material Appp',
      home: Scaffold(
        drawer: Drawer(
          // child: ListView(
          //   padding: EdgeInsets.zero,
          //   children: [
          //     DrawerHeader(
          //       child: Column(
          //         children: [
          //           Expanded(
          //             child: Image.asset('images/rrhh_logo_persona.png'),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
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
                // Container(
                //   margin: const EdgeInsets.only(top: 30),
                //   padding: const EdgeInsets.all(20),
                //   width: double.infinity,
                //   color: Colors.grey[100],
                //   child: const Text("Inicio"),
                // ),
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
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.thumb_up_outlined),
                  title: Text('Solicitar Permiso'),
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => MyHomePage()));
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
                // Expanded(child: Container()),
                // OutlinedButton.icon(
                //     onPressed: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => MyHomePage()));
                //     },
                //     icon: Icon(
                //       Icons.exit_to_app,
                //       size: 18,
                //     ),
                //     label: Text("Cerrar Sesión")),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Text('Mi Perfil'),
          backgroundColor: Color.fromARGB(255, 52, 182, 189),
        ),

        // children: [
        //   const ListTile(
        //     title: Text('Nombre'),
        //     subtitle: Text('Juan Roman Riquelme Rojas'),
        //   ),
        //   ListTile(
        //     title: Text('Nombre'),
        //     subtitle: Text('Juan Roman Riquelme Rojas'),
        //   ),
        // ],

        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                // width: 100,
                // height: 100,
                margin: const EdgeInsets.all(10),
                // child: Image.asset("images/rrhh_logo_persona.png"),
                // child: Color.,
              ),
              const Text(
                "Datos Personales",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              // Container(
              //   margin: const EdgeInsets.only(top: 30),
              //   padding: const EdgeInsets.all(20),
              //   width: double.infinity,
              //   color: Colors.grey[100],
              //   child: const Text("Inicio"),
              // ),
              // var hola = "holanda",
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Nombre'),
                subtitle: Text(aa),
              ),
              ListTile(
                leading: Icon(Icons.numbers),
                title: Text('CI'),
                subtitle: Text(bb),
              ),
              ListTile(
                leading: Icon(Icons.date_range_outlined),
                title: Text('Fecha de Nacimiento'),
                subtitle: Text(cc),
              ),
              ListTile(
                leading: Icon(Icons.man_outlined),
                title: Text('Sexo'),
                subtitle: Text(dd),
              ),
              ListTile(
                leading: Icon(Icons.home_outlined),
                title: Text('Dirección'),
                subtitle: Text(ee),
              ),
              ListTile(
                leading: Icon(Icons.work),
                title: Text('Puesto Laboral'),
                subtitle: Text('Desarrollador Frontend'),
              ),
              ListTile(
                leading: Icon(Icons.home_outlined),
                title: Text('Usuario Movil'),
                subtitle: Text(nom_empleado),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
