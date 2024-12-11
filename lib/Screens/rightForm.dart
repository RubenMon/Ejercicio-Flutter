import 'package:flutter/material.dart';

class RightForm extends StatefulWidget {
  const RightForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RightFormState createState() => _RightFormState();
}

class _RightFormState extends State<RightForm> {
  final _formKey = GlobalKey<FormState>();
  String? _gender; // Variable para el valor del grupo de radio
  final Set<String> _hobbies = {}; // Usamos un Set para almacenar las aficiones seleccionadas
  DateTime? _selectedDate; // Variable para almacenar la fecha seleccionada

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Campo de fecha de nacimiento
          TextFormField(
            decoration: const InputDecoration(labelText: 'Fecha de Nacimiento'),
            controller: TextEditingController(
              text: _selectedDate == null
                  ? ''
                  : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
            ),
            keyboardType: TextInputType.datetime,
            onTap: () async {
              FocusScope.of(context).requestFocus(FocusNode()); // Evita que aparezca el teclado
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null && pickedDate != _selectedDate) {
                setState(() {
                  _selectedDate = pickedDate; // Actualiza la fecha seleccionada
                });
              }
            },
            readOnly: true, // Hace que el campo no sea editable directamente, solo con el picker
          ),

          // Dropdown para seleccionar ciudad
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'Ciudad de Andalucía'),
            items: [
              'Sevilla',
              'Málaga',
              'Granada',
              'Córdoba',
              'Huelva',
              'Almería',
              'Jaén',
              'Cádiz'
            ].map((city) {
              return DropdownMenuItem(value: city, child: Text(city));
            }).toList(),
            onChanged: (value) {},
          ),

          // Título de Aficiones
          const Text('Aficiones'),
          CheckboxListTile(
            title: const Text('Deporte'),
            value: _hobbies.contains('Deporte'), // Verifica si está seleccionado
            onChanged: (value) {
              setState(() {
                if (value == true) {
                  _hobbies.add('Deporte');
                } else {
                  _hobbies.remove('Deporte');
                }
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Música'),
            value: _hobbies.contains('Música'),
            onChanged: (value) {
              setState(() {
                if (value == true) {
                  _hobbies.add('Música');
                } else {
                  _hobbies.remove('Música');
                }
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Lectura'),
            value: _hobbies.contains('Lectura'),
            onChanged: (value) {
              setState(() {
                if (value == true) {
                  _hobbies.add('Lectura');
                } else {
                  _hobbies.remove('Lectura');
                }
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Viajar'),
            value: _hobbies.contains('Viajar'),
            onChanged: (value) {
              setState(() {
                if (value == true) {
                  _hobbies.add('Viajar');
                } else {
                  _hobbies.remove('Viajar');
                }
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Cine'),
            value: _hobbies.contains('Cine'),
            onChanged: (value) {
              setState(() {
                if (value == true) {
                  _hobbies.add('Cine');
                } else {
                  _hobbies.remove('Cine');
                }
              });
            },
          ),

          // Título de Sexo
          const Text('Sexo'),
          RadioListTile<String>(
            title: const Text('Hombre'),
            value: 'Hombre',
            groupValue: _gender, // Se debe vincular con el grupo
            onChanged: (value) {
              setState(() {
                _gender = value;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Mujer'),
            value: 'Mujer',
            groupValue: _gender, // Se debe vincular con el grupo
            onChanged: (value) {
              setState(() {
                _gender = value;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Prefiero no contestar'),
            value: 'Prefiero no contestar',
            groupValue: _gender, // Se debe vincular con el grupo
            onChanged: (value) {
              setState(() {
                _gender = value;
              });
            },
          ),

          // Botón de enviar
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() == true) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Formulario Enviado')),
                );
              }
            },
            child: const Text('Enviar'),
          ),
        ],
      ),
    );
  }
}