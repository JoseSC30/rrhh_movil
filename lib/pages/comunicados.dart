import 'package:flutter/material.dart';
import 'package:si2_rrhh_movil_prueba/pages/miperfil.dart';
import 'package:si2_rrhh_movil_prueba/pages/principal.dart';
import 'package:si2_rrhh_movil_prueba/pages/sueldos.dart';

import '../main.dart';
import '../usuario.dart';

import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:io';

List<Comunicado> comun = comunicados;
String asd = comun[0].detalle;

class Comunicados extends StatefulWidget {
  const Comunicados({super.key});

  @override
  State<Comunicados> createState() => _ComunicadosState();
}

class _ComunicadosState extends State<Comunicados> {
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
                  title: Text('Solicitar Permisos'),
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
                //   onPressed: () {
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => MyHomePage()));
                //   },
                //   icon: Icon(
                //     Icons.exit_to_app,
                //     size: 18,
                //   ),
                //   label: Text("Cerrar Sesión"),
                // ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Text('Comunicados Generales'),
          backgroundColor: Color.fromARGB(255, 52, 182, 189),
        ),
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
                "Comunicados Generales",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              // Container(
              //   margin: const EdgeInsets.only(top: 30),
              //   padding: const EdgeInsets.all(20),
              //   width: double.infinity,
              //   color: Colors.grey[100],
              //   child: const Text("Inicio"),
              // ),

              // comun.forEach((element) {
              //   final Comunicado com = element;
              //   const ListTile(
              //   leading: Icon(Icons.book),
              //   title: Text((com.titulo),
              //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              //   ),
              //   subtitle: Text(com.detalle),
              // ),
              // });

              const ListTile(
                leading: Icon(Icons.book),
                title: Text(
                  'Limpieza de Instalaciones',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                subtitle: Text(
                    'Recordar a los trabajares de los niveles 10,11,12 y 13, de la limpieza que se realizara durante todo el dia de mañana jueves 20 de octubre...'),
              ),
              const ListTile(
                leading: Icon(Icons.book_outlined),
                title: Text(
                  'Sobre las reglas COVID-19',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                subtitle: Text(
                    'Las políticas de la empresa se han visto afectadas por los ultimos sucesos referentes a la pandemia por la que la sociedad atraviesa en este momento...'),
              ),
              const ListTile(
                leading: Icon(Icons.book),
                title: Text(
                  'Evaluación Semestral',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                subtitle: Text(
                    'Los procesos requeridos para la proxima evaluación semestral de la empresa, para con sus trabajadores, ha culminado, de acuerdo a esto se requiere..'),
              ),
              const ListTile(
                leading: Icon(Icons.book_outlined),
                title: Text(
                  'Aniversario de la Empresa',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                subtitle: Text(
                    'La fecha mas importante de la empresa es una festividad que se realiza año tras año. Sabemos que actualmente no será como en años pasados. El confinamiento ...'),
              ),
              // const ListTile(
              //   leading: Icon(Icons.book),
              //   title: Text(
              //     '(IMPORTANTE) Pagos Atrasados',
              //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              //   ),
              //   subtitle: Text(
              //       'En el presente comunicado informamos estar al tanto de los sueldos atrasados, y otorgamos nuestras mas sinceras disculpas por este motivo. La reestructuracion...'),
              // ),

              const ListTile(
                leading: Icon(Icons.book),
                title: Text(
                  '(IMPORTANTE) Pagos Atrasados',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                subtitle: Text(aa),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
