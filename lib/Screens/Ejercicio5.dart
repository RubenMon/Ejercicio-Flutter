import 'package:flutter/material.dart';

class Ejercicio5 extends StatelessWidget {
  const Ejercicio5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes1.mainTheme, // Aplica el tema centralizado
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ejemplo de filas y columnas anidadas'),
          centerTitle: true,
        ),
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
      ),
    );
  }
}

class AppThemes1 {
  static final ThemeData mainTheme = ThemeData(
    scaffoldBackgroundColor: Colors.lightBlue.shade50, // Fondo del Scaffold
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueAccent,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Colors.black87,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
}