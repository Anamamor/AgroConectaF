import 'package:flutter/material.dart';
import 'agricultor_home.dart'; // Asegúrate que este archivo existe y esté bien importado

class LoginAgricultor extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" Agricultor")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(labelText: "Correo"),
            ),
            SizedBox(height: 20),
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(labelText: "Contraseña"),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green[300]),
              child: Text("Ingresar"),
              onPressed: () {
                // Validación básica (puedes mejorarla después)
                if (email.text.isNotEmpty && password.text.isNotEmpty) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => AgricultorHome()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Por favor, llena ambos campos")),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
