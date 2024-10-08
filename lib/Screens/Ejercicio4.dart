import 'package:flutter/material.dart';

class Ejercicio4 extends StatelessWidget {
  const Ejercicio4({super.key});

    @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ejercicio 4'),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.home,
                size: 50.0,
                color: Colors.blue,
              ),
              SizedBox(height: 20), // Espacio entre los iconos
              Icon(
                Icons.star,
                size: 50.0,
                color: Colors.yellow,
              ),
              SizedBox(height: 20), // Espacio entre los iconos
              Icon(
                Icons.favorite,
                size: 50.0,
                color: Colors.red,
              ),
              SizedBox(height: 20), // Espacio entre los iconos
              Icon(
                Icons.settings,
                size: 50.0,
                color: Colors.grey,
              ),
              SizedBox(height: 20), // Espacio entre los iconos
              Icon(
                Icons.person,
                size: 50.0,
                color: Colors.green,
              ),
            ],
          ),
        ),
      );
  }
}