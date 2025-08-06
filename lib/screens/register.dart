import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final name = TextEditingController();
  final age = TextEditingController();
  final address = TextEditingController();
  final municipality = TextEditingController();
  String role = "Agricultor";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8F5),
      appBar: AppBar(
        title: const Text("Registro"),
        backgroundColor: Colors.green[300],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                "Crea tu cuenta",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF387C44),
                ),
              ),
              const SizedBox(height: 25),

              // Email
              _buildTextField(email, "Correo electrónico"),

              // Nombre
              _buildTextField(name, "Nombre completo"),

              // Edad
              _buildTextField(age, "Edad", keyboardType: TextInputType.number),

              // Domicilio
              _buildTextField(address, "Domicilio"),

              // Municipio
              _buildTextField(municipality, "Municipio"),

              const SizedBox(height: 15),

              // Rol
              DropdownButtonFormField<String>(
                value: role,
                decoration: _inputDecoration("Rol"),
                items: ["Agricultor", "Consumidor"]
                    .map((rol) => DropdownMenuItem(value: rol, child: Text(rol)))
                    .toList(),
                onChanged: (val) => setState(() => role = val!),
              ),

              const SizedBox(height: 30),

              // Botón de registro
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[300],
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 2,
                ),
                child: const Text("Registrarse", style: TextStyle(fontSize: 18)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Registro enviado")),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Función para reutilizar los campos de texto
  Widget _buildTextField(TextEditingController controller, String label, {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: _inputDecoration(label),
        validator: (value) => value == null || value.isEmpty ? "Este campo es requerido" : null,
      ),
    );
  }

  // Función para decoración moderna y suave
  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.white,
      labelStyle: const TextStyle(color: Colors.black87),
      contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFB0BEC5)),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF66BB6A), width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
