import 'package:flutter/material.dart';
import 'chat_simulado.dart';

class NuevoChat extends StatelessWidget {
  final List<String> clientesDisponibles = [
    'Cliente Luis',
    'Cliente Karla',
    'Cliente Roberto',
    'Cliente Sandra',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Iniciar Nuevo Chat')),
      body: ListView.builder(
        itemCount: clientesDisponibles.length,
        itemBuilder: (context, index) {
          final cliente = clientesDisponibles[index];
          return ListTile(
            leading: Icon(Icons.person_outline),
            title: Text(cliente),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatSimulado(nombreCliente: cliente),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
