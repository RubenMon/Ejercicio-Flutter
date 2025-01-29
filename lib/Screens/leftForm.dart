import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class LeftForm extends StatefulWidget {
  const LeftForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LeftFormState createState() => _LeftFormState();
}

class _LeftFormState extends State<LeftForm> {
  final _formKey = GlobalKey<FormState>();
  bool hasChildren = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Nombre Completo'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingresa tu nombre';
              } else if (!RegExp(r'^[A-ZÁÉÍÓÚÑ][a-zA-ZáéíóúÁÉÍÓÚñÑ\s]*$').hasMatch(value)) {
                return 'El nombre debe empezar con mayúscula y solo puede contener letras, tildes, la letra ñ y espacios';
              } else if (value.length < 3) {
                return 'El nombre debe tener al menos 3 caracteres';
              }
                return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Correo Electrónico'),
            keyboardType: TextInputType.emailAddress,
           validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingresa tu correo';
              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Ingresa un correo válido';
              }
                return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Teléfono'),
            keyboardType: TextInputType.phone,
            validator: (value) {
              final phoneRegex = RegExp(r'^\d{9,10}$');
              if (value == null || !phoneRegex.hasMatch(value)) {
                return 'Por favor ingrese un número de teléfono válido';
              }
              return null;
            },
          ),
          CheckboxListTile(
            title: const Text('¿Tiene hijos?'),
            value: hasChildren,
            onChanged: (value) {
              setState(() {
                hasChildren = value ?? false;
              });
            },
          ),
          if (hasChildren)
            TextFormField(
              decoration: const InputDecoration(labelText: 'Número de hijos(max 3)'),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value != null && int.tryParse(value) == null) {
                  return 'Por favor ingrese un número válido';
                }
                return null;
              },
            ),
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