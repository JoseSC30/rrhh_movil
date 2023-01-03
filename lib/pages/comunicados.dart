import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:si2_rrhh_movil_prueba/pages/miperfil.dart';
import 'package:si2_rrhh_movil_prueba/pages/principal.dart';
import 'package:si2_rrhh_movil_prueba/pages/sueldos.dart';
import 'package:si2_rrhh_movil_prueba/main.dart';
import 'package:http/http.dart' as http;
import '../funciones_extracion.dart';
import '../main.dart';
import '../screen/login.dart';
import '../usuario.dart';

import 'package:flutter/services.dart';

import 'dart:io';

class Comunicados extends StatefulWidget {
  const Comunicados({super.key});

  @override
  State<Comunicados> createState() => _ComunicadosState();
}

class _ComunicadosState extends State<Comunicados> {
  @override
  Widget build(BuildContext context) {
    getComunicados();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material Appp',
      home: Scaffold(
        appBar: AppBar(
          // title: Text('Bienvenido $nom_empleado'),
          backgroundColor: Color.fromARGB(255, 52, 182, 189),
          title:
              const Text("COMUNICADOS", style: TextStyle(color: Colors.white)),
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
              child:
                  const Text("Log Out", style: TextStyle(color: Colors.white)),
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
                        MaterialPageRoute(builder: (context) => MainPage()));
                  },
                ),
              ],
            ),
          ),
        ),
        // appBar: AppBar(
        //   title: Text('Comunicados Generales'),
        //   backgroundColor: Color.fromARGB(255, 52, 182, 189),
        // ),

        //CODIGO PARA MOSTRAR LOS COMUNICADOS.

        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: comunicados.length,
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
                            Text(
                              comunicados[index].titulo,
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              comunicados[index].detalle,
                              style: TextStyle(
                                  fontSize: 14, color: Colors.cyan[900]),
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
}
