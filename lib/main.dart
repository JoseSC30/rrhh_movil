import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
/*
  var usuarioController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
            child: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: usuarioController,
              decoration: InputDecoration(
                  labelText: "Usuario",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.person_sharp)),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Contraseña",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.password)),
            ),
            SizedBox(
              height: 45,
            ),
            OutlinedButton.icon(
                onPressed: () {
                  // login();
                  getUsers();
                },
                icon: Icon(
                  Icons.login,
                  size: 18,
                ),
                label: Text("Iniciar Sesión")),
          ],
        ))),
      ),
    );
  }

  //CREANDO FUNCION PARA LLAMAR LOGIN POST API
  // Future<void> login() async {
  //   if (passwordController.text.isNotEmpty &&
  //       usuarioController.text.isNotEmpty) {
  //     var response = await http.post(
  //         Uri.parse("http://192.168.0.8/api/cuentas"),
  //         body: ({
  //           'usuario': usuarioController.text,
  //           'password': passwordController.text
  //         }));
  //     if (response.statusCode == 200) {
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => Second()));
  //     } else {
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(SnackBar(content: Text("Invalid Credentials.")));
  //     }
  //   } else {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text("Black Field Not Allowed")));
  //   }
  // }

  Future<void> getUsers() async {
    final res =
        await http.get(Uri.parse("http://10.0.2.2:8000/api/get_usuariomovils"));
    final lista = List.from(jsonDecode(res.body));

    List<User> users = [];
    lista.forEach((element) {
      final User user = User.fromJson(element);
      users.add(user);
    });

    var login = false;
    users.forEach((element) {
      final User uss = element;
      if ((usuarioController.text == uss.usuario) &&
          (passwordController.text == uss.contrasena)) {
        login = true;
        nom_empleado = usuarioController.text;
        usuariomovil_id = uss.id;
      }
    });

    final empleadoObtenido =
        await http.get(Uri.parse("http://10.0.2.2:8000/api/get_empleados"));
    final empleLista = List.from(jsonDecode(empleadoObtenido.body));

    List<Empleado> empleados = [];
    empleLista.forEach((element) {
      final Empleado empleado = Empleado.fromJson(element);
      empleados.add(empleado);
    });

    empleados.forEach((element) {
      final Empleado emp = element;
      if ((usuariomovil_id.toString() == emp.usuariomovil)) {
        aa = emp.nombre;
        bb = emp.ci;
        cc = emp.fnacimiento;
        dd = emp.sexo;
        ee = emp.direccion;
        ff = emp.puestolaboral;
      }
    });

    if (login) {
      Navigator.push(
          // context, MaterialPageRoute(builder: (context) => Second()));
          context,
          MaterialPageRoute(builder: (context) => Principal()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Invalid Credentials.")));
    }
  }

*/

  // late SharedPreferences sharedPreferences;

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
