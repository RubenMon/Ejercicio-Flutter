import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/MenuLateral.dart'; // Importación del Drawer personalizado

void main() {
  runApp(const Entrega3());
}

class Entrega3 extends StatelessWidget {
  const Entrega3({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Juego de la Imagen',
      debugShowCheckedModeBanner: false, // Desactivamos el banner de debug
      home: Juego(),
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
  bool imagenPulsada = false; // Variable para controlar si se ha pulsado la imagen

  @override
  void initState() {
    super.initState();
    iniciaTiempo();
  }

  void iniciaTiempo() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        if (!imagenPulsada) {
          // Resta puntos si no se ha pulsado la imagen
          puntos -= 2;
        }
        // Cambia posición de la imagen de manera aleatoria
        double tamanioPantalla = MediaQuery.of(context).size.height / 2;
        double coordenadaYAleatoria = Random().nextDouble() * (tamanioPantalla - 50) + 50;

        posicionX = Random().nextDouble() * 0.9; // Posición X aleatoria hasta el 90% de la pantalla
        posicionY = coordenadaYAleatoria / MediaQuery.of(context).size.height; // Posición Y aleatoria dentro de límites seguros

        imagenPulsada = false; // Reiniciar el estado de la pulsación
      });
    });
  }

  void pulsarImagen() {
    setState(() {
      if (!imagenPulsada) { // Solo se obtiene un punto si no se ha pulsado antes
        // Sumar puntos al pulsar la imagen
        puntos += 1;
        imagenPulsada = true; // Marcar que la imagen ha sido pulsada
      }

      // Mostrar alerta si los puntos son 5
      if (puntos == 5) {
        _mostrarAlerta();
      }
    });
  }

  // Función para mostrar el dialog cuando se llega a 5 puntos
  void _mostrarAlerta() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¡Enhorabuena!'),
          content: const Text('¡Llevas 5 puntos!'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juego de la Imagen'),
        centerTitle: true, // Centrar el título del AppBar
        automaticallyImplyLeading: false, // Desactiva el icono por defecto del Drawer
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu), // Icono del Drawer
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Abre el Drawer
                },
              );
            },
          ),
        ],
      ),
      drawer: const MenuLateral(), // Drawer personalizado
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
              children: [
                const SizedBox(height: 20),
                Text(
                  'Puntos: $puntos',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}