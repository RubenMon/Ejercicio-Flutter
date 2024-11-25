import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/Screens/MenuLateral.dart'; // Asegúrate de que este archivo sea importado si lo necesitas

class Ejercicio1 extends StatelessWidget {
  const Ejercicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio 1"),
        automaticallyImplyLeading: false, // Esto evita que el ícono del menú aparezca en la esquina superior izquierda
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
      body: Center(
        child: Text(
          'Rubén Montero Martín',
          style: GoogleFonts.aladin(
            color: const Color.fromARGB(255, 250, 16, 66),
            letterSpacing: 8.0,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}