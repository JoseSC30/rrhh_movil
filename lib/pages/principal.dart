import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:si2_rrhh_movil_prueba/pages/marcarhora.dart';
import 'package:si2_rrhh_movil_prueba/pages/miperfil.dart';
import 'package:http/http.dart' as http;
import 'package:si2_rrhh_movil_prueba/pages/comunicados.dart';
import 'package:si2_rrhh_movil_prueba/pages/permisos.dart';
import '../funciones_extracion.dart';
import 'package:si2_rrhh_movil_prueba/pages/sueldos.dart';

import '../main.dart';
import '../usuario.dart';

//LISTA DONDE SE GUARDAN LOS COMUNICADOS.
List<Comunicado> comunicados = [];
//LISTA DONDE SE GUARDAN LOS SUELDOS.
List<Sueldo> sueldos = [];
//LISTA DONDE SE GUARDAN LOS SUELDOS del EMPLEADO.
List<Sueldo> sueldosE = [];
//LISTA DONDE SE GUARDAN LOS PERMISOS.
List<Permiso> permisos = [];
//LISTA DONDE SE GUARDAN LOS PERMISOS del EMPLEADO.
List<Permiso> permisosE = [];

//LISTA DONDE SE GUARDAN LAS ASISTENCIAS.
List<Asistencia> asistencias = [];
//LISTA DONDE SE GUARDAN LAS ASISTENCIAS del EMPLEADO.
List<Asistencia> asistenciasE = [];

//Variable donde se guarda la informacion del API.
var infoApi;

//
class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => PrincipalState();
}

class PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    getComunicados();

    getSueldos();
    guardarSueldosDelEmpleado();

    getAsistencias();
    guardarAsistenciasDelEmpleado();

    getPermisos();
    guardarPermisosDelEmpleado();
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
                  margin: const EdgeInsets.all(50),
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
                        MaterialPageRoute(builder: (context) => MainPage()));
                  },
                ),
                Expanded(child: Container()),
                Container(
                    // margin: const EdgeInsets.only(top: 2),
                    // padding: const EdgeInsets.all(20),
                    // width: double.infinity,
                    // color: Colors.black87,
                    // alignment: Alignment.center,
                    // child: const Text("Cerrar Sesion",
                    //     style: TextStyle(
                    //         color: Colors.white, fontWeight: FontWeight.bold)),

                    ),
                OutlinedButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainPage()));
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
          title: Text('Bienvenido $nom_empleado'),
          backgroundColor: Color.fromARGB(255, 52, 182, 189),
        ),
      ),
    );
  }
}
