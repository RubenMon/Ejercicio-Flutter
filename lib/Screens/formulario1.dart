import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/menuLateral.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<Formulario> {
  final llaveFormulario = GlobalKey<FormState>();

  // Controladores para los campos
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  DateTime? _selectedDate;

  // Estado para Radio Buttons y Checkboxes
  String? _selectedGender;
  bool _acceptTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  // Método para seleccionar una fecha
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text =
            '${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de Registro'),
      ),
      endDrawer: const MenuLateral() as Widget, // Usando el Drawer definido
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: llaveFormulario,
          child: ListView(
            children: [
              // Campo de Nombre
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre Completo',
                  border: OutlineInputBorder(),
                ),
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
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 16.0),

              // Campo de Correo
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Correo Electronico',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa tu correo';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Ingresa un correo válido';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0),
              // Campo de Contraseña
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa una contraseña';
                  } else if (value.length < 8) {
                    return 'La contraseña debe tener al menos 8 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Campo de Fecha de nacimiento
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Fecha de nacimiento',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context),
                  ),
                ),
                readOnly: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, selecciona una fecha';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Radio Buttons para Género
              const Text('Género:', style: TextStyle(fontSize: 16.0)),
              RadioListTile<String>(
                title: const Text('Masculino'),
                value: 'Masculino',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Femenino'),
                value: 'Femenino',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),

              // Checkbox para Términos y Condiciones
              CheckboxListTile(
                title: const Text('Acepto los términos y condiciones'),
                value: _acceptTerms,
                onChanged: (value) {
                  setState(() {
                    _acceptTerms = value ?? false;
                  });
                },
              ),
              const SizedBox(height: 16.0),

              // Botón de envío
              ElevatedButton(
                onPressed: () {
                  if (llaveFormulario.currentState!.validate() && _acceptTerms) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Formulario enviado exitosamente'),
                      ),
                    );
                  } else if (!_acceptTerms) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Debes aceptar los términos y condiciones'),
                      ),
                    );
                  }
                },
                child: const Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
