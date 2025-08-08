import 'package:flutter/material.dart';
import 'login_agricultor.dart';
import 'login_consumidor.dart';
import 'register.dart';

class UserSelectorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8F5), // Fondo suave
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ícono en lugar del logo
              const Icon(
                Icons.agriculture,
                size: 120,
                color: Color(0xFF387C44), // Verde oscuro
              ),

              const SizedBox(height: 20),

              // Nombre de la app
              const Text(
                "AgroConecta",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF387C44), // Verde oscuro
                ),
              ),

              const SizedBox(height: 40),

              const Text(
                "¿Quién eres?",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),

              // Botón Agricultor
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[300],
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Soy Agricultor", style: TextStyle(fontSize: 18)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => LoginAgricultor()));
                },
              ),

              const SizedBox(height: 20),

              // Botón Consumidor
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[400],
                  foregroundColor: Colors.black87,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Soy Consumidor", style: TextStyle(fontSize: 18)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => LoginConsumidor()));
                },
              ),

              const SizedBox(height: 40),

              // Enlace para registro
              TextButton(
                child: const Text(
                  "¿No tienes cuenta? Regístrate",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
