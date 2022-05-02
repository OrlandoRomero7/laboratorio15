import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:lab15/pages/mostrar.dart';

class MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<SalesData> chartData = [];

  @override
  void initState() {
    loadSalesData();
    super.initState();
  }

  Future loadSalesData() async {
    final String jsonString = await obtenerJson();
    final dynamic jsonResponse = json.decode(jsonString);
    for (Map<String, dynamic> i in jsonResponse)
      chartData.add(SalesData.fromJson(i));
  }

  Future<String> obtenerJson() async {
    final respuesta = await http.get(
        Uri.parse('https://prueba-8d6ca-default-rtdb.firebaseio.com/.json'));
    return respuesta.body;
    /*String url = "https://prueba-8d6ca-default-rtdb.firebaseio.com/.json";
    http.Response response = await http.get(Uri.parse(url));
    return response.body;*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Estudiantes'),
        ),
        body: Center(
          child: FutureBuilder(
              future: obtenerJson(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  return ListView.builder(
                      itemCount: chartData.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            chartData[index].matricula,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(chartData[index].nombre),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Mostrar(estudiantes: chartData[index]),
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

class SalesData {
  String matricula = "";
  String nombre = "";
  String carrera = "";
  String semestre = "";
  String telefono = "";
  String correo = "";

  SalesData(this.matricula, this.nombre, this.carrera, this.semestre,
      this.telefono, this.correo);

  factory SalesData.fromJson(Map<String, dynamic> mapaJson) {
    return SalesData(
      mapaJson['matricula'],
      mapaJson['nombre'],
      mapaJson['carrera'],
      mapaJson['semestre'],
      mapaJson['telefono'],
      mapaJson['correo'],
    );
  }
}
