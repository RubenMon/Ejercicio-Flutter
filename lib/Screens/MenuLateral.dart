import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Ejercicio3.dart';
import 'package:flutter_application_1/Screens/Ejercicio4.dart';
import 'package:flutter_application_1/Screens/Entrega3.dart';
import 'Ejercicio1.dart';
import 'Ejercicio2.dart';

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
                    image: AssetImage(
                        "asset/images/malaga2.jpg"),
                    fit: BoxFit.cover)),
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const Ejercicio1()));
              },
            ),
          ),
          ListTile(
            title: const Text("Ejercicio 2"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Ejercicio2()));
            },
          ),
          ListTile(
            title: const Text("Ejercicio 3"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Ejercicio3()));
            },
          ),
          ListTile(
            title: const Text("Ejercicio 4"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Ejercicio4()));
            },
          ),
          ListTile(
            title: const Text("Entrega 3"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Entrega3()));
            },
          ),
        ],
      ),
    );
  }
}