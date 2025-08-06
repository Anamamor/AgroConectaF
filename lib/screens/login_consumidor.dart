import 'package:flutter/material.dart';

class LoginConsumidor extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Consumidor")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(controller: email, decoration: InputDecoration(labelText: "Correo")),
            SizedBox(height: 20),
            TextField(controller: password, obscureText: true, decoration: InputDecoration(labelText: "Contraseña")),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green[300]),
              child: Text("Ingresar"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
