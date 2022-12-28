import 'package:flutter/material.dart';
import 'package:si2_rrhh_movil_prueba/pages/comunicados.dart';
import 'package:si2_rrhh_movil_prueba/pages/miperfil.dart';

import '../main.dart';

class Sueldos extends StatefulWidget {
  const Sueldos({super.key});

  @override
  State<Sueldos> createState() => _SueldosState();
}

class _SueldosState extends State<Sueldos> {
  @override
  Widget build(BuildContext context) {
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
                Expanded(child: Container()),
                OutlinedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage()));
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
          title: Text('Historial de Pagos'),
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
              const ListTile(
                leading: Icon(Icons.calendar_month),
                title: Text(
                  '(NO RETIRADO) OCTUBRE - 2022',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                subtitle: Text('Depositado en fecha: 15-10-2022'),
              ),
              const ListTile(
                leading: Icon(Icons.calendar_month),
                title: Text(
                  'SEPTIEMBRE - 2022',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                subtitle: Text('Depositado en fecha: 15-09-2022'),
              ),
              const ListTile(
                leading: Icon(Icons.calendar_month),
                title: Text(
                  'AGOSTO - 2022',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                subtitle: Text('Depositado en fecha: 17-08-2022'),
              ),
              const ListTile(
                leading: Icon(Icons.calendar_month),
                title: Text(
                  'JULIO - 2022',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                subtitle: Text('Depositado en fecha: 14-07-2022'),
              ),
              const ListTile(
                leading: Icon(Icons.calendar_month),
                title: Text(
                  'JUNIO - 2022',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                subtitle: Text('Depositado en fecha: 15-06-2022'),
              ),
              const ListTile(
                leading: Icon(Icons.calendar_month),
                title: Text(
                  'MAYO - 2022',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                subtitle: Text('Depositado en fecha: 14-05-2022'),
              ),
              const ListTile(
                leading: Icon(Icons.calendar_month),
                title: Text(
                  'ABRIL - 2022',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                subtitle: Text('Depositado en fecha: 16-04-2022'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
