import 'package:flutter/material.dart';

class Ejercicio3 extends StatelessWidget {
  const Ejercicio3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio 3"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('asset/images/malaga2.jpg'),
              width: 300,
            ),
            SizedBox(height: 10), // Espacio entre las imágenes
            Image(
              image: AssetImage('asset/images/malaga3.jpg'),
              width: 300,
            ),
            SizedBox(height: 10), // Espacio entre las imágenes
            Image(
              image: AssetImage('asset/images/malaga4.jpg'),
              width: 300,
            ),
          ],
        ),
      ),
    );
  }
}