import 'package:flutter/material.dart';
import 'package:si2_rrhh_movil_prueba/funciones_extracion.dart';
import 'package:si2_rrhh_movil_prueba/main.dart';
import 'package:si2_rrhh_movil_prueba/pages/comunicados.dart';
import 'package:si2_rrhh_movil_prueba/pages/miperfil.dart';
import 'package:si2_rrhh_movil_prueba/pages/permisos.dart';
import 'package:si2_rrhh_movil_prueba/pages/principal.dart';
import 'package:si2_rrhh_movil_prueba/pages/sueldos.dart';
import 'package:si2_rrhh_movil_prueba/screen/login.dart';

class MarcaHora extends StatefulWidget {
  const MarcaHora({super.key});

  @override
  State<MarcaHora> createState() => _MarcaHoraState();
}

class _MarcaHoraState extends State<MarcaHora> {
  @override
  Widget build(BuildContext context) {
    getAsistencias();
    guardarAsistenciasDelEmpleado();
    var now = DateTime.now();
    var hour = now.hour - 4;
    if (hour == -4) {
      hour = 20;
    } else {
      if (hour == -3) {
        hour = 21;
      } else {
        if (hour == -2) {
          hour = 22;
        } else {
          if (hour == -1) {
            hour = 23;
          }
        }
      }
    }
    var minute = now.minute;
    var second = now.second;
    var year = now.year;
    var month = now.month;
    var day = now.day;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material Appp',
      home: Scaffold(
        appBar: AppBar(
          // title: Text('Bienvenido $nom_empleado'),
          backgroundColor: Color.fromARGB(255, 52, 182, 189),
          title:
              const Text("Marcar Hora", style: TextStyle(color: Colors.white)),
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
              ],
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.access_time_outlined, color: Colors.black),
                title: Text(
                  "Hora y Fecha a Registrar.",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                subtitle: Text(
                  'Hora: ${hour}:${minute}:${second} \nFecha: ${day}/${month}/${year}',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              OutlinedButton(
                  onPressed: () {
                    marcarLlegada();
                  },
                  child: Text(
                    'Marcar Llegada',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 52, 182, 189),
                      maximumSize: Size(300, 70))),
              OutlinedButton(
                  onPressed: () {
                    marcarSalida();
                  },
                  child: Text(
                    'Marcar Salida',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 52, 182, 189),
                      maximumSize: Size(300, 70))),
              Container(
                padding: EdgeInsets.all(7),
              ),
              const ListTile(
                title: Text(
                  'PERIODOS REGISTRADOS',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: asistenciasE.length,
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
                            ListTile(
                              leading: Icon(Icons.timer_sharp),
                              title: Text(
                                "Fecha: ${asistenciasE[index].fecha}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              subtitle: Text(
                                  "Hora Llegada: ${asistenciasE[index].hora_llegada}\nHora Salida: ${asistenciasE[index].hora_salida}"),
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
