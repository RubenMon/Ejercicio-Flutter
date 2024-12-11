import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("Rubén Montero Martín"),
            accountEmail: Text("rmonmar0810@g.educaand.es"),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/images/malaga2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Ink(
            color: const Color.fromARGB(255, 234, 128, 22),
            child: ListTile(
              title: const Text(
                "Ejercicio 1",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop(); // Cierra el Drawer
                Navigator.pushNamed(context, '/primera'); // Navega a Ejercicio 1
              },
            ),
          ),
          ListTile(
            title: const Text("Ejercicio 2"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.pushNamed(context, '/segunda'); // Navega a Ejercicio 2
            },
          ),
          ListTile(
            title: const Text("Ejercicio 3"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.pushNamed(context, '/tercera'); // Navega a Ejercicio 3
            },
          ),
          ListTile(
            title: const Text("Ejercicio 4"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.pushNamed(context, '/cuarta'); // Navega a Ejercicio 4
            },
          ),
          ListTile(
            title: const Text("Ejercicio 5"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.pushNamed(context, '/quinta'); // Navega a Ejercicio 5
            },
          ),
          ListTile(
            title: const Text("Ejercicio 6"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.pushNamed(context, '/sexta'); // Navega a Ejercicio 6
            },
          ),
          ListTile(
            title: const Text("Reto"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.pushNamed(context, '/septima'); // Navega a Reto
            },
          ),
          ListTile(
            title: const Text("Instagram"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.pushNamed(context, '/octava'); // Navega a Instagram
            },
          ),
          ListTile(
            title: const Text("Entrega 3"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.pushNamed(context, '/novena'); // Navega a Entrega 3
            },
          ),
          ListTile(
            title: const Text("Siete y medio"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.pushNamed(context, '/decima'); // Navega a Entrega 3
            },
          ),
          ListTile(
            title: const Text("Formulario"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.pushNamed(context, '/undecima'); // Navega a Formulario
            },
          ),
          ListTile(
            title: const Text("Adivina el número"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.pushNamed(context, '/duodecima'); // Navega a Formulario
            },
          ),
          ListTile(
            title: const Text("Formulario 2 - No Dual"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.pushNamed(context, '/tredecima'); // Navega a Formulario
            },
          ),
        ],
      ),
    );
  }
}