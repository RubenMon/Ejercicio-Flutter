import 'package:flutter/material.dart';

class Ejercicio2 extends StatelessWidget {
  const Ejercicio2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio 2"),
      ),
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('asset/images/malaga2.jpg'),
              width: 120,
              height: 300,
            ),
            SizedBox(width: 10), // Espacio entre las imágenes
            Image(
              image: AssetImage('asset/images/malaga3.jpg'),
              width: 120,
              height: 300,
            ),
            SizedBox(width: 10), // Espacio entre las imágenes
            Image(
              image: AssetImage('asset/images/malaga4.jpg'),
              width: 120,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}