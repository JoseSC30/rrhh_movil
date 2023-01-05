import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:si2_rrhh_movil_prueba/pages/permisos.dart';
import 'package:si2_rrhh_movil_prueba/pages/principal.dart';

import '../usuario.dart';

//*****************************************************//
//NOTA 1: En este archivo vamos a declarar todas las funciones
//para extraer los datos del API.
//
//NOTA 2: La variable "comunicados", que es de tipo
//List<Comunicado>, fue declarada en el archivo "principal.dart".
//****************************************************//

//FUNCION PARA EXTRAER TODOS LOS COMUNCADOS DEL API.

Future<void> getComunicados() async {
  final comunicaObtenidos = await http
      .get(Uri.parse("http://10.0.2.2:8000/api/get_comunicados")); //API
  final comunicaLista = List.from(jsonDecode(comunicaObtenidos.body));

//Elimina los elementos de la lista "comunicados" que se almacenaron previamente.
  comunicados.clear();

  //Los elementos dentro de "ComunicaLista", lo guardo
  //en la lista "comunicados".
  comunicaLista.forEach((element) {
    final Comunicado comunicado = Comunicado.fromJson(element);
    comunicados.add(comunicado);
  });
}

//***** FUNCIONES - SUELDOS ******//

Future<void> getSueldos() async {
  final sueldosObtenidos =
      await http.get(Uri.parse("http://10.0.2.2:8000/api/get_sueldos")); //API
  // var sueldosLista = json.decode(sueldosObtenidos.body);
  final sueldosLista = List.from(jsonDecode(sueldosObtenidos.body));

//Elimina los elementos de la lista "sueldos" que se almacenaron previamente.
  sueldos.clear();
  sueldosE.clear();

  //Los elementos dentro de "SueldoLista", lo guardo
  //en la lista "sueldos".
  sueldosLista.forEach((element) {
    final Sueldo sueldo = Sueldo.fromJson(element);
    sueldos.add(sueldo);
  });
}

void guardarSueldosDelEmpleado() {
  sueldos.forEach((element) {
    if (infoApi['id'] == element.empleado_id) {
      sueldosE.add(element);
    }
  });
}

//***** FUNCIONES - PERMISOS ******//

Future<void> getPermisos() async {
  final permisosObtenidos =
      await http.get(Uri.parse("http://10.0.2.2:8000/api/get_permisos")); //API

  final permisosLista = List.from(jsonDecode(permisosObtenidos.body));

  permisos.clear();
  permisosE.clear();

  permisosLista.forEach((element) {
    final Permiso permiso = Permiso.fromJson(element);
    permisos.add(permiso);
  });
}

void guardarPermisosDelEmpleado() {
  permisos.forEach((element) {
    if (infoApi['usuariomovil_id'] == element.usuariomovil_id) {
      permisosE.add(element);
    }
  });
}

void enviarSolicitudPermiso() async {
  final response = await http.post(
    Uri.parse("http://10.0.2.2:8000/api/post_permisos"),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      "detalle": detalle.text,
      "usuariomovil_id": infoApi['usuariomovil_id']
    }),
  );
}

//***** FUNCIONES - ASISTENCIAS ******//

Future<void> getAsistencias() async {
  final asistenciasObtenidos = await http
      .get(Uri.parse("http://10.0.2.2:8000/api/get_asistencias")); //API
  final asistenciasLista = List.from(jsonDecode(asistenciasObtenidos.body));

  asistencias.clear();
  asistenciasE.clear();

  asistenciasLista.forEach((element) {
    final Asistencia asistencia = Asistencia.fromJson(element);
    asistencias.add(asistencia);
  });
}

void guardarAsistenciasDelEmpleado() {
  asistencias.forEach((element) {
    if (infoApi['usuariomovil_id'] == element.usuariomovil_id) {
      asistenciasE.add(element);
    }
  });
}

void marcarLlegada() async {
  final response = await http.post(
    Uri.parse("http://10.0.2.2:8000/api/post_llegada"),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({"usuariomovil_id": infoApi['usuariomovil_id']}),
  );
}

void marcarSalida() async {
  final response = await http.post(
    Uri.parse("http://10.0.2.2:8000/api/post_salida"),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({"usuariomovil_id": infoApi['usuariomovil_id']}),
  );
}
