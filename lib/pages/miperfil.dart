import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:si2_rrhh_movil_prueba/pages/comunicados.dart';
import 'package:si2_rrhh_movil_prueba/pages/marcarhora.dart';
import 'package:si2_rrhh_movil_prueba/pages/permisos.dart';
import 'package:si2_rrhh_movil_prueba/pages/sueldos.dart';
import 'package:si2_rrhh_movil_prueba/usuario.dart';

import '../main.dart';
import '../screen/login.dart';

class MiPefil extends StatefulWidget {
  const MiPefil({super.key});

  @override
  State<MiPefil> createState() => _MiPefilState();
}

class _MiPefilState extends State<MiPefil> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material Appp',
      home: Scaffold(
        appBar: AppBar(
          // title: Text('Bienvenido $nom_empleado'),
          backgroundColor: Color.fromARGB(255, 52, 182, 189),
          title: const Text("MI PERFIL", style: TextStyle(color: Colors.white)),
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
                subtitle: Text(empleado.nombre),
              ),
              ListTile(
                leading: Icon(Icons.numbers),
                title: Text('CI'),
                subtitle: Text(empleado.ci),
              ),
              ListTile(
                leading: Icon(Icons.date_range_outlined),
                title: Text('Fecha de Nacimiento'),
                subtitle: Text(empleado.fnacimiento),
              ),
              ListTile(
                leading: Icon(Icons.man_outlined),
                title: Text('Sexo'),
                subtitle: Text(empleado.sexo),
              ),
              ListTile(
                leading: Icon(Icons.home_outlined),
                title: Text('Dirección'),
                subtitle: Text(empleado.direccion),
              ),
              ListTile(
                leading: Icon(Icons.work),
                title: Text('Puesto Laboral'),
                subtitle: Text(empleado.puestolaboral),
              ),
              ListTile(
                leading: Icon(Icons.home_outlined),
                title: Text('Usuario Movil'),
                subtitle: Text(emailController.text),
              ),
            ],
          ),
        ),
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
                     Navigator.push(context,
                         MaterialPageRoute(builder: (context) => MarcaHora()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.thumb_up_outlined),
                  title: Text('Solicitar Permiso'),
                  onTap: () {
                     Navigator.push(context,
                         MaterialPageRoute(builder: (context) => Permisos()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
