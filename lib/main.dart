import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:si2_rrhh_movil_prueba/pages/principal.dart';
import 'package:si2_rrhh_movil_prueba/second.dart';
import 'package:si2_rrhh_movil_prueba/usuario.dart';
import 'package:flutter/services.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: MyHomePage(),
      home: Principal(), //CAMBIAR POR MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
}
