import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      backgroundColor: const Color(0xFFF0F9F4),
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.green[800]),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Registro",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.green[800],
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Icon(Icons.person_add_alt_1_rounded, size: 80, color: Colors.green[400]),
              const SizedBox(height: 10),
              Text(
                "Registro de Usuario",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.green[800],
                ),
              ),
              const SizedBox(height: 25),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildTextField(email, "Correo electrónico", icon: Icons.email_outlined),
                    _buildTextField(name, "Nombre completo", icon: Icons.person_outline),
                    _buildTextField(age, "Edad", keyboardType: TextInputType.number, icon: Icons.cake_outlined),
                    _buildTextField(address, "Domicilio", icon: Icons.home_outlined),
                    _buildTextField(municipality, "Municipio", icon: Icons.location_city_outlined),
                    const SizedBox(height: 15),
                    DropdownButtonFormField<String>(
                      value: role,
                      decoration: _inputDecoration("Rol", icon: Icons.badge_outlined),
                      items: ["Agricultor", "Consumidor"]
                          .map((rol) => DropdownMenuItem(value: rol, child: Text(rol)))
                          .toList(),
                      onChanged: (val) => setState(() => role = val!),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[600],
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        elevation: 4,
                        shadowColor: Colors.greenAccent,
                      ),
                      icon: const Icon(Icons.check_circle_outline),
                      label: Text(
                        "Registrarse",
                        style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Registro enviado")),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "¿Ya tienes cuenta? Inicia sesión",
                        style: GoogleFonts.poppins(
                          color: Colors.green[700],
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {TextInputType keyboardType = TextInputType.text, IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: _inputDecoration(label, icon: icon),
        validator: (value) => value == null || value.isEmpty ? "Este campo es requerido" : null,
      ),
    );
  }

  InputDecoration _inputDecoration(String label, {IconData? icon}) {
    return InputDecoration(
      labelText: label,
      prefixIcon: icon != null ? Icon(icon, color: Colors.green[400]) : null,
      filled: true,
      fillColor: Colors.white,
      labelStyle: GoogleFonts.poppins(color: Colors.black87),
      contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFB0BEC5)),
        borderRadius: BorderRadius.circular(14),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF43A047), width: 2),
        borderRadius: BorderRadius.circular(14),
      ),
    );
  }
}
