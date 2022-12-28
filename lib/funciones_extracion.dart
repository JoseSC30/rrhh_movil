import 'dart:convert';

import 'package:http/http.dart' as http;
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
