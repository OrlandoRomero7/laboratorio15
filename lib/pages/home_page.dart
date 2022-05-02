import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lab15/pages/Estudiantes.dart';
import 'package:lab15/pages/mostrar.dart';

class MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Estudiante> datos = [];

  @override
  void initState() {
    cargarJson();
    super.initState();
  }

  Future cargarJson() async {
    final String jsonString = await obtenerJson();
    final dynamic jsonResponse = json.decode(jsonString);
    for (Map<String, dynamic> i in jsonResponse) {
      datos.add(Estudiante.fromJson(i));
    }
  }

  Future<String> obtenerJson() async {
    final respuesta = await http.get(
        Uri.parse('https://prueba-8d6ca-default-rtdb.firebaseio.com/.json'));
    return respuesta.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 233, 57, 115),
          title: const Text('Estudiantes'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://i.pinimg.com/originals/9e/a9/5e/9ea95e67a35d51a1bf5ac9f1c0bf590d.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: FutureBuilder(
              future: obtenerJson(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  return ListView.builder(
                      itemCount: datos.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            datos[index].nombre,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(datos[index].carrera),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Mostrar(estudiantes: datos[index]),
                              ),
                            );
                          },
                        );
                      });
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ));
  }
}
