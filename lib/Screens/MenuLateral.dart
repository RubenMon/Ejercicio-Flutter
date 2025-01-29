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
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/primera');
              },
            ),
          ),
          ListTile(
            title: const Text("Ejercicio 2"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/segunda');
            },
          ),
          ListTile(
            title: const Text("Ejercicio 3"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/tercera');
            },
          ),
          ListTile(
            title: const Text("Ejercicio 4"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/cuarta');
            },
          ),
          ListTile(
            title: const Text("Ejercicio 5"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/quinta');
            },
          ),
          ListTile(
            title: const Text("Ejercicio 6"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/sexta');
            },
          ),
          ListTile(
            title: const Text("Reto"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/septima');
            },
          ),
          ListTile(
            title: const Text("Instagram"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/octava');
            },
          ),
          ListTile(
            title: const Text("Entrega 3"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/novena');
            },
          ),
          ListTile(
            title: const Text("Siete y medio"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/decima');
            },
          ),
          ListTile(
            title: const Text("Formulario"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/undecima');
            },
          ),
          ListTile(
            title: const Text("Adivina el número"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/duodecima');
            },
          ),
          ListTile(
            title: const Text("Formulario 2 - No Dual"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/tredecima');
            },
          ),
        ],
      ),
    );
  }
}