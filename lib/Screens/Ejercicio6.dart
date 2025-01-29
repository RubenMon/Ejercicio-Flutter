import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/MenuLateral.dart';

// Aquí deberías tener tu clase MenuLateral ya definida.
class ContadorPage extends StatefulWidget {
  const ContadorPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ContadorPageState createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  int _contador = 0;

  void _sumar() {
    setState(() {
      _contador++;
    });
  }

  void _restar() {
    setState(() {
      _contador--;
    });
  }

  void _resetear() {
    setState(() {
      _contador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
      ),
      drawer: const MenuLateral(), // Aquí se usa el Drawer con la clase MenuLateral
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Contador:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '$_contador',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _sumar,
                  iconSize: 40,
                ),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: _restar,
                  iconSize: 40,
                ),
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: _resetear,
                  iconSize: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}