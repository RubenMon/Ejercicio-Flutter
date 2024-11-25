import 'package:flutter/material.dart';
import 'Screens/menuLateral.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo de drawer(Rubén Montero Martín)',
      debugShowCheckedModeBanner: false, // Desactivar el banner de depuración
      theme: ThemeData(
        // Define el color del scaffold
        scaffoldBackgroundColor: Colors.lightBlue.shade50,
        // Personalización de la AppBar
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),

        // Define estilos globales de texto
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
          titleLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Actividad01(Drawer)"),
        ),
        drawer: const MenuLateral(),
        body: const Center(
          child: Text("https://github.com/RubenMon/Ejercicio-Flutter.git"),
        ),
      ),
    );
  }
}
