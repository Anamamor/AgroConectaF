import 'package:flutter/material.dart';

class PerfilSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CircleAvatar(radius: 50, backgroundColor: Colors.green[200], child: Icon(Icons.person, size: 50)),
          SizedBox(height: 10),
          Text("Nombre: Pedro Ramírez"),
          Text("Edad: 45"),
          Text("Domicilio: Ejido San Juan"),
          Text("Municipio: Tlalpan"),
          Text("Rol: Agricultor"),
        ],
      ),
    );
  }
}
