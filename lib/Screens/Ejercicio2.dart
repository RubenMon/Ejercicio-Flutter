import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/MenuLateral.dart'; // Asegúrate de que este archivo sea importado si lo necesitas

class Ejercicio2 extends StatelessWidget {
  const Ejercicio2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio 2"),
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
      drawer: const MenuLateral() as Widget, // Este es el menú lateral que se abrirá
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