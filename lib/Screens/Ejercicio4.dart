import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/MenuLateral.dart'; // Asegúrate de que este archivo sea importado si lo necesitas

class Ejercicio4 extends StatelessWidget {
  const Ejercicio4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 4'),
        automaticallyImplyLeading: false, // Evita que el ícono de menú aparezca en la izquierda
        actions: [
          // Usamos un Builder para obtener el contexto correcto
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Abre el Drawer
                },
              );
            },
          ),
        ],
      ),
      drawer: const MenuLateral(), // Este es el menú lateral que se abrirá
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