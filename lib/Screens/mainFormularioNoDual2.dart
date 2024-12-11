import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/MenuLateral.dart';
import 'package:flutter_application_1/Screens/leftForm.dart';
import 'package:flutter_application_1/Screens/rightForm.dart';

class FormularioSwitch extends StatefulWidget {
  const FormularioSwitch({super.key});

  @override
  _FormularioSwitchState createState() => _FormularioSwitchState();
}

class _FormularioSwitchState extends State<FormularioSwitch> {
  bool isLeftForm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario con Switch'),
        automaticallyImplyLeading: false, // Evita que el ícono de retroceder aparezca en la AppBar
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Abre el Drawer al hacer clic en el ícono de menú
                },
              );
            },
          ),
        ],
      ),
      drawer: const MenuLateral(), // Menú lateral que se abre desde la izquierda
      body: Column(
        children: [
          // Switch para alternar entre los formularios
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Switch Form'),
                Switch(
                  value: isLeftForm,
                  onChanged: (value) {
                    setState(() {
                      isLeftForm = value;
                    });
                  },
                ),
              ],
            ),
          ),
          // Muestra el formulario seleccionado
          Expanded(
            child: isLeftForm ? const LeftForm() : const RightForm(),
          ),
        ],
      ),
    );
  }
}