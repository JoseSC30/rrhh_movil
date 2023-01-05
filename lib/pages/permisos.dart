// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:si2_rrhh_movil_prueba/funciones_extracion.dart';
import 'package:si2_rrhh_movil_prueba/main.dart';
import 'package:si2_rrhh_movil_prueba/pages/comunicados.dart';
import 'package:si2_rrhh_movil_prueba/pages/marcarhora.dart';
import 'package:si2_rrhh_movil_prueba/pages/miperfil.dart';
import 'package:si2_rrhh_movil_prueba/pages/principal.dart';
import 'package:si2_rrhh_movil_prueba/screen/login.dart';

import 'sueldos.dart';

class Permisos extends StatefulWidget {
  const Permisos({super.key});

  @override
  State<Permisos> createState() => _PermisosState();
}

final detalle = TextEditingController();

class _PermisosState extends State<Permisos> {
  @override
  Widget build(BuildContext context) {
    getPermisos();
    guardarPermisosDelEmpleado();
    // final detalle = TextEditingController();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material Appp',
      home: Scaffold(
        //BOTTON
        // floatingActionButton: FloatingActionButton(
        //     onPressed: () {}, child: const Icon(Icons.add)),
        floatingActionButton: FloatingActionButton.extended(
            label: const Text('Solicitar Permiso'),
            icon: const Icon(Icons.add),
            onPressed: showForm),
        //

        appBar: AppBar(
          // title: Text('Bienvenido $nom_empleado'),
          backgroundColor: Color.fromARGB(255, 52, 182, 189),
          title: const Text("Historial Permisos",
              style: TextStyle(color: Colors.white)),
          actions: <Widget>[
            // ignore: deprecated_member_use
            TextButton(
              onPressed: () {
                sharedPreferences.clear();
                sharedPreferences.commit();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => const LoginPage()),
                    (Route<dynamic> route) => false);
              },
              child: const Text("Cerrar Sesión",
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
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
              ],
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: permisosE.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.blue, width: 1))),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   "Detalle del Permiso: ${permisosE[index].detalle}",
                            //   style: TextStyle(fontSize: 16),
                            // ),
                            ListTile(
                              leading: Icon(Icons.linear_scale_rounded),
                              title: Text(
                                "Detalle: ${permisosE[index].detalle}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              subtitle:
                                  Text("Fecha: ${permisosE[index].fecha}"),
                            ),
                          ]),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  showForm() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: const Text("Motivo del permiso"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: detalle,
                    decoration:
                        InputDecoration(hintText: "Motivo del permiso."),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancelar"),
                ),
                TextButton(
                  onPressed: () {
                    enviarSolicitudPermiso();
                    Navigator.of(context).pop();
                  },
                  child: const Text("Guardar"),
                )
              ]);
        });
  }
}
