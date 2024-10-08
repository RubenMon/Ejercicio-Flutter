import 'package:flutter/material.dart';
import 'Screens/MenuLateral.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ejemplo de drawer(Rubén Montero Martín)',
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Actividad01(Drawer)"),
          ),
          drawer: const MenuLateral(),
          body: const Center(
            child: Text("https://github.com/RubenMon/Ejercicio-Flutter.git"),
          ),
        ));
  }
}