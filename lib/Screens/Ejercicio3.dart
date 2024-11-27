import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/MenuLateral.dart'; // Asegúrate de que este archivo sea importado si lo necesitas

class Ejercicio3 extends StatelessWidget {
  const Ejercicio3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio 3"),
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