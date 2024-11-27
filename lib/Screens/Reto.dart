import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/MenuLateral.dart'; // Importamos el menú lateral

class RetoAPP extends StatelessWidget {
  const RetoAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Challenge'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false, // Evitamos el ícono en la izquierda
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Abrimos el Drawer
                },
              );
            },
          ),
        ],
      ),
      drawer: const MenuLateral() as Widget, // Usamos el Drawer centralizado
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: const EdgeInsets.only(top: 50), // Margen superior
          width: 200, // Ancho del contenedor
          height: 200, // Altura del contenedor
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.blueAccent, // Color del borde
              width: 5.0, // Grosor del borde
            ),
          ),
          child: const Center(
            child: Text(
              'H',
              style: TextStyle(
                fontSize: 80, // Tamaño del texto
                color: Colors.blueAccent, // Color del texto
                fontWeight: FontWeight.bold, // Negrita
              ),
            ),
          ),
        ),
      ),
    );
  }
}