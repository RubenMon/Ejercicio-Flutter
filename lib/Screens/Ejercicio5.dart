import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/MenuLateral.dart';

class Ejercicio5 extends StatelessWidget {
  const Ejercicio5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de filas y columnas anidadas'),
        centerTitle: true,
        automaticallyImplyLeading: false, // Elimina el ícono predeterminado de menú a la izquierda
        actions: [
          // Icono de menú en la esquina superior derecha
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Primera fila
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'asset/images/cristiano0.jpg',
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            const SizedBox(height: 20), // Espacio entre filas

            // Segunda fila
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'asset/images/cristiano1.jpg',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(width: 20), // Espacio entre imágenes
                Image.asset(
                  'asset/images/cristiano2.jpg',
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            const SizedBox(height: 20), // Espacio entre filas

            // Tercera fila
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'asset/images/cristiano3.jpg',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(width: 20),
                Image.asset(
                  'asset/images/cristiano4.jpg',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(width: 20),
                Image.asset(
                  'asset/images/cristiano5.jpg',
                  width: 100,
                  height: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}