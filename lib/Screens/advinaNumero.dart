import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/menuLateral.dart';
import 'dart:math';

class AdivinaNumero extends StatefulWidget {
  const AdivinaNumero({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NumberGuessingScreenState createState() => _NumberGuessingScreenState();
}

class _NumberGuessingScreenState extends State<AdivinaNumero> {
  final TextEditingController _controller = TextEditingController();
  final int _targetNumber = Random().nextInt(100) + 1;
  String _message = '';
  int _attempts = 0;

  void _checkNumber() {
    setState(() {
      _attempts++;
      int? enteredNumber = int.tryParse(_controller.text);

      if (enteredNumber == null) {
        _message = 'Por favor, introduce un número válido.';
      } else if (enteredNumber < 1 || enteredNumber > 100) {
        _message = 'Introduce un número entre 1 y 100.';
      } else if (enteredNumber < _targetNumber) {
        _message = 'El número es mayor que $enteredNumber.';
      } else if (enteredNumber > _targetNumber) {
        _message = 'El número es menor que $enteredNumber.';
      } else {
        _message = '¡Felicidades! Has acertado el número $_targetNumber en $_attempts intentos.';
      }

      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adivina el Número'),
      ),
      endDrawer: const MenuLateral() as Widget, // Añadimos el Drawer lateral
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Introduce un número entre 1 y 100:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Número',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _checkNumber,
              child: const Text('Comprobar'),
            ),
            const SizedBox(height: 20),
            Text(
              _message,
              style: const TextStyle(fontSize: 16, color: Colors.blueAccent),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}