import 'package:flutter/material.dart';
import 'package:lab15/pages/home_page.dart';

void main() {
  return runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
