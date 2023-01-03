import 'package:flutter/material.dart';
import 'package:si2_rrhh_movil_prueba/main.dart';
import 'package:si2_rrhh_movil_prueba/pages/comunicados.dart';
import 'package:si2_rrhh_movil_prueba/pages/marcarhora.dart';
import 'package:si2_rrhh_movil_prueba/pages/miperfil.dart';

import 'sueldos.dart';

class Permisos extends StatefulWidget {
  const Permisos({super.key});

  @override
  State<Permisos> createState() => _PermisosState();
}

class _PermisosState extends State<Permisos> {
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
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Text('Permisos'),
          backgroundColor: Color.fromARGB(255, 52, 182, 189),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                // width: 100,
                // height: 100,
                margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
                child: TextField(
                  autofocus: true,
                  maxLength: 400,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.admin_panel_settings_outlined),
                    hintText: 'Escriba el motivo aqui',
                  ),
                ),
              ),
              OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'SOLICITAR',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.cyan[400],
                  )),
              Container(
                padding: EdgeInsets.all(10),
              ),
              const ListTile(
                title: Text(
                  'HISTORIAL',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.linear_scale_rounded),
                title: Text(
                  'PERMISO SEPTIEMBRE - 2022',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                subtitle: Text('Permiso en fecha: 14-05-2022'),
              ),
              const ListTile(
                leading: Icon(Icons.linear_scale_rounded),
                title: Text(
                  'PERMISO MARZO - 2022',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                subtitle: Text('Permiso en fecha: 16-04-2022'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
