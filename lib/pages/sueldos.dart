import 'package:flutter/material.dart';
import 'package:si2_rrhh_movil_prueba/funciones_extracion.dart';
import 'package:si2_rrhh_movil_prueba/pages/comunicados.dart';
import 'package:si2_rrhh_movil_prueba/pages/marcarhora.dart';
import 'package:si2_rrhh_movil_prueba/pages/miperfil.dart';
import 'package:si2_rrhh_movil_prueba/pages/permisos.dart';
import 'package:si2_rrhh_movil_prueba/pages/principal.dart';
import 'package:si2_rrhh_movil_prueba/pages/sueldos.dart';
import '../main.dart';
import '../screen/login.dart';

class Sueldos extends StatefulWidget {
  // getSueldos();
  // guardarSueldosDelEmpleado();
  const Sueldos({super.key});

  @override
  State<Sueldos> createState() => _SueldosState();
}

class _SueldosState extends State<Sueldos> {
  @override
  Widget build(BuildContext context) {
    getSueldos();
    guardarSueldosDelEmpleado();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material Appp',
      home: Scaffold(
        appBar: AppBar(
          // title: Text('Bienvenido $nom_empleado'),
          backgroundColor: Color.fromARGB(255, 52, 182, 189),
          title: const Text("HISTORIAL SUELDOS",
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
              // Container(
              //   // width: 100,
              //   // height: 100,
              //   margin: const EdgeInsets.all(10),
              //   // child: Image.asset("images/rrhh_logo_persona.png"),
              //   // child: Color.,
              // ),
              // const ListTile(
              //   leading: Icon(Icons.calendar_month),
              //   title: Text(
              //     '(NO RETIRADO) OCTUBRE - 2022',
              //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              //   ),
              //   subtitle: Text(sueldos[1].monto),
              // ),
              // const ListTile(
              //   leading: Icon(Icons.calendar_month),
              //   title: Text(
              //     'SEPTIEMBRE - 2022',
              //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              //   ),
              //   subtitle: Text('Depositado en fecha: 15-09-2022'),
              // ),
              // const ListTile(
              //   leading: Icon(Icons.calendar_month),
              //   title: Text(
              //     'AGOSTO - 2022',
              //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              //   ),
              //   subtitle: Text('Depositado en fecha: 17-08-2022'),
              // ),
              // const ListTile(
              //   leading: Icon(Icons.calendar_month),
              //   title: Text(
              //     'JULIO - 2022',
              //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              //   ),
              //   subtitle: Text('Depositado en fecha: 14-07-2022'),
              // ),
              // const ListTile(
              //   leading: Icon(Icons.calendar_month),
              //   title: Text(
              //     'JUNIO - 2022',
              //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              //   ),
              //   subtitle: Text('Depositado en fecha: 15-06-2022'),
              // ),
              // const ListTile(
              //   leading: Icon(Icons.calendar_month),
              //   title: Text(
              //     'MAYO - 2022',
              //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              //   ),
              //   subtitle: Text('Depositado en fecha: 14-05-2022'),
              // ),
              // const ListTile(
              //   leading: Icon(Icons.calendar_month),
              //   title: Text(
              //     'ABRIL - 2022',
              //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              //   ),
              //   subtitle: Text('Depositado en fecha: 16-04-2022'),
              // ),
              const ListTile(
                title: Text(
                  'ULTIMOS SUELDOS',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: sueldosE.length,
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
                              leading: Icon(Icons.attach_money),
                              title: Text(
                                "Depositado: ${sueldosE[index].monto} bs.",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              subtitle: Text(
                                  "Fecha: ${sueldosE[index].fecha}\nHora: ${sueldosE[index].hora}"),
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
