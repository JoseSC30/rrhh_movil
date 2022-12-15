import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:si2_rrhh_movil_prueba/pages/miperfil.dart';
import 'package:si2_rrhh_movil_prueba/pages/principal.dart';
import 'package:si2_rrhh_movil_prueba/pages/sueldos.dart';

import '../main.dart';
import '../usuario.dart';

import 'package:flutter/services.dart';

import 'dart:io';

List<Comunicado> comun = comunicados;

class Comunicados extends StatefulWidget {
  const Comunicados({super.key});

  @override
  State<Comunicados> createState() => _ComunicadosState();
}

class _ComunicadosState extends State<Comunicados> {
  @override
  Widget build(BuildContext context) {
    void generarlistas() {} //
    ;
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

              //----- ERROR DE EL forEach RESOLVER
              //----- PARA EL PROXIMO SPRINT.

              // comunicados.forEach((element) {
              //   // for(var element in comun){
              //   final Comunicado com = element;
              //   ListTile(
              //     leading: Icon(Icons.book),
              //     title: Text(
              //       (com.titulo),
              //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              //     ),
              //     subtitle: Text(com.detalle),
              //   );
              // }),

              ListTile(
                leading: Icon(Icons.book),
                title: Text(comunicados[0].titulo),
                subtitle: Text(comunicados[0].detalle),
              ),
              ListTile(
                leading: Icon(Icons.book),
                title: Text(comunicados[1].titulo),
                subtitle: Text(comunicados[1].detalle),
              ),
              // ListTile(
              //   leading: Icon(Icons.book),
              //   title: Text(comunicados[2].titulo),
              //   subtitle: Text(comunicados[2].detalle),
              // ),
              // ListTile(
              //   leading: Icon(Icons.book),
              //   title: Text(comun[3].titulo),
              //   subtitle: Text(comun[3].detalle),
              // ),
              // ListTile(
              //   leading: Icon(Icons.book),
              //   title: Text(comun[4].titulo),
              //   subtitle: Text(comun[4].detalle),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
