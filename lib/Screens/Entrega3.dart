import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const Entrega3());
}

class Entrega3 extends StatelessWidget {
  const Entrega3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juego de la Imagen',
      debugShowCheckedModeBanner: false, // Desactivar el banner de depuración
      theme: ThemeData(
        primarySwatch: Colors.blue, // Paleta de colores primaria
        scaffoldBackgroundColor: Colors.lightBlue.shade50, // Fondo claro para el Scaffold
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent, // Fondo de la AppBar
          titleTextStyle: TextStyle(
            color: Colors.white, // Color del texto en la AppBar
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Colors.black87, // Texto general en negro
          ),
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Títulos principales
          ),
        ),
      ),
      home: const Juego(),
    );
  }
}

class Juego extends StatefulWidget {
  const Juego({super.key});

  @override
  // ignore: library_private_types_in_public_api
  juegosEstado createState() => juegosEstado();
}

// ignore: camel_case_types
class juegosEstado extends State<Juego> {
  int puntos = 0;
  double posicionX = 0;
  double posicionY = 0;
  bool imagenPulsada = false;

  @override
  void initState() {
    super.initState();
    iniciaTiempo();
  }

  void iniciaTiempo() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        if (!imagenPulsada) {
          puntos -= 2;
        }
        double tamanioPantalla = MediaQuery.of(context).size.height / 2;
        double coordenadaYAleatoria = Random().nextDouble() * (tamanioPantalla - 50) + 50;

        posicionX = Random().nextDouble() * 0.9;
        posicionY = coordenadaYAleatoria / MediaQuery.of(context).size.height;

        imagenPulsada = false;
      });
    });
  }

  void pulsarImagen() {
    setState(() {
      if (!imagenPulsada) {
        puntos += 1;
        imagenPulsada = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juego de la Imagen'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width * posicionX,
            top: MediaQuery.of(context).size.height * posicionY,
            child: GestureDetector(
              onTap: pulsarImagen,
              child: Image.asset(
                'asset/images/malaga2.jpg',
                width: 100,
                height: 100,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Puntos: $puntos',
                  style: Theme.of(context).textTheme.titleLarge, // Aplica el tema para el texto
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
