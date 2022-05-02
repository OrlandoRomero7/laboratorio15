import 'package:flutter/material.dart';
import 'package:lab15/pages/Estudiantes.dart';

class Mostrar extends StatelessWidget {
  final Estudiante estudiantes;
  const Mostrar({Key? key, required this.estudiantes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 233, 57, 115),
          title: Text(estudiantes.nombre),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://marketplace.canva.com/EAEtlMvlBDg/1/0/900w/canva-pastel-peach-watercolour-mobile-phone-wallpaper--8ZGLXxywc8.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.fromLTRB(10, 90, 10, 0),
          //padding: EdgeInsets.all(100.0),
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Text(
                  "Nombre: " +
                      estudiantes.nombre +
                      "\n\n" +
                      "Matricula: " +
                      estudiantes.matricula +
                      "\n\n" +
                      "Carrera: " +
                      estudiantes.carrera +
                      "\n\n" +
                      "Semestre: " +
                      estudiantes.semestre +
                      "\n\n" +
                      "Telefono: " +
                      estudiantes.telefono +
                      "\n\n" +
                      "Correo: " +
                      estudiantes.correo,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                );
              }),
        ));
  }
}
