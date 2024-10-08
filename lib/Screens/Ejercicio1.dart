import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Ejercicio1 extends StatelessWidget {
  const Ejercicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio 1"),
      ),
      body: Center(
                child: Text(
              'Rubén Montero Martín',
              style: GoogleFonts.aladin(
                color: const Color.fromARGB(255, 250, 16, 66),
                letterSpacing: 8.0,
                fontSize: 25,
              ),
            )));
  }
}