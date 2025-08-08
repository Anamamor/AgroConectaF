import 'package:flutter/material.dart';
import 'chatC_simulado.dart';  // IMPORTANTE: importa la clase ChatSimulado

class MensajesPage extends StatelessWidget {
  const MensajesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> chats = [
      'Agricultor José',
      'Agricultora María',
      'Productor Juan',
    ];

    return Scaffold(
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final nombre = chats[index];
          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFFB9E4C9),
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Text(nombre),
            subtitle: const Text("Hola, ¿aún tienes productos disponibles?"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatSimulado(nombre: nombre),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
