import 'package:flutter/material.dart';

class Estudiante {
  String matricula = "";
  String nombre = "";
  String carrera = "";
  String semestre = "";
  String telefono = "";
  String correo = "";

  Estudiante(this.matricula, this.nombre, this.carrera, this.semestre,
      this.telefono, this.correo);

  factory Estudiante.fromJson(Map<String, dynamic> mapaJson) {
    return Estudiante(
      mapaJson['matricula'],
      mapaJson['nombre'],
      mapaJson['carrera'],
      mapaJson['semestre'],
      mapaJson['telefono'],
      mapaJson['correo'],
    );
  }
}
