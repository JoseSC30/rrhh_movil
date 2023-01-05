import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:si2_rrhh_movil_prueba/pages/marcarhora.dart';
import 'package:si2_rrhh_movil_prueba/screen/login.dart';

import 'package:http/http.dart' as http;
import 'package:si2_rrhh_movil_prueba/pages/principal.dart';
import 'package:si2_rrhh_movil_prueba/second.dart';
import 'package:si2_rrhh_movil_prueba/usuario.dart';
import 'package:flutter/services.dart';

import 'pages/comunicados.dart';
import 'pages/miperfil.dart';
import 'pages/sueldos.dart';

void main() {
  runApp(const MyApp());
}

var nom_empleado = "";
var usuariomovil_id = 0;
var aaa = "hola";

var aa = "";
var bb = "";
var cc = "";
var dd = "";
var ee = "";
var ff = "";
var gg = "";

late SharedPreferences sharedPreferences;

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
      // home: Principal(), //CAMBIAR POR MyHomePage()
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => const LoginPage()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material Appp',
      home: Scaffold(
        appBar: AppBar(
          // title: Text('Bienvenido $nom_empleado'),
          backgroundColor: Color.fromARGB(255, 52, 182, 189),
          title: const Text("Recursos Humanos",
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
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => MyHomePage()));
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
