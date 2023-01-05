

class User {
  int id;
  String usuario;
  String contrasena;

  User({required this.id, required this.usuario, required this.contrasena});

  factory User.fromJson(Map json) {
    return User(
      id: json["id"],
      usuario: json["usuario"],
      contrasena: json["contrasena"],
    );
  }
}

class Empleado {
  int id;
  String nombre;
  String ci;
  String fnacimiento;
  String sexo;
  String direccion;
  String puestolaboral;
  String usuariomovil;

  Empleado(
      {required this.id,
      required this.nombre,
      required this.ci,
      required this.fnacimiento,
      required this.sexo,
      required this.direccion,
      required this.puestolaboral,
      required this.usuariomovil});

  factory Empleado.fromJson(Map json) {
    return Empleado(
      id: json["id"],
      nombre: json["nombre"],
      ci: json["ci"],
      fnacimiento: json["fnacimiento"],
      sexo: json["sexo"],
      direccion: json["direccion"],
      puestolaboral: json["puestolaboral_id"],
      usuariomovil: json["usuariomovil_id"],
    );
  }
}

class Comunicado {
  int id;
  String titulo;
  String detalle;
  String fecha;
  String hora;

  Comunicado(
      {required this.id,
      required this.titulo,
      required this.detalle,
      required this.fecha,
      required this.hora});

  factory Comunicado.fromJson(Map json) {
    return Comunicado(
      id: json["id"],
      titulo: json["titulo"],
      detalle: json["detalle"],
      fecha: json["fecha"],
      hora: json["hora"],
    );
  }
}

class Sueldo {
  int id;
  int empleado_id;
  int monto;
  String hora;
  String fecha;

  Sueldo(
      {required this.id,
      required this.empleado_id,
      required this.monto,
      required this.hora,
      required this.fecha});

  factory Sueldo.fromJson(Map json) {
    return Sueldo(
      id: json["id"],
      empleado_id: json["empleado_id"],
      monto: json["monto"],
      hora: json["hora"],
      fecha: json["fecha"],
    );
  }
}

class Permiso {
  int id;
  int usuariomovil_id;
  String detalle;
  String hora;
  String fecha;

  Permiso(
      {required this.id,
      required this.usuariomovil_id,
      required this.detalle,
      required this.hora,
      required this.fecha});

  factory Permiso.fromJson(Map json) {
    return Permiso(
      id: json["id"],
      usuariomovil_id: json["usuariomovil_id"],
      detalle: json["detalle"],
      hora: json["hora"],
      fecha: json["fecha"],
    );
  }
}

class Asistencia {
  int id;
  String hora_llegada;
  String hora_salida;
  String fecha;
  int usuariomovil_id;

  Asistencia(
      {required this.id,
      required this.hora_llegada,
      required this.hora_salida,
      required this.fecha,
      required this.usuariomovil_id});

  factory Asistencia.fromJson(Map json) {
    return Asistencia(
      id: json["id"],
      hora_llegada: json["hora_llegada"],
      hora_salida: json["hora_salida"],
      fecha: json["fecha"],
      usuariomovil_id: json["usuariomovil_id"],
    );
  }
}
