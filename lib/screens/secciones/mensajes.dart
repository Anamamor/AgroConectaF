import 'package:flutter/material.dart';
import 'chat_simulado.dart';
import 'nuevo_chat.dart'; // Asegúrate de tener este archivo creado

class MensajesSection extends StatelessWidget {
  final List<Map<String, String>> conversaciones = [
    {'nombre': 'Juan', 'ultimoMensaje': '¿Cuánto cuesta el kilo?'},
    {'nombre': 'María', 'ultimoMensaje': '¿Envías a domicilio?'},
    {'nombre': 'Pedro', 'ultimoMensaje': 'Listo, ya hice el pago.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: conversaciones.length,
          itemBuilder: (context, index) {
            final cliente = conversaciones[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green[200],
                child: Text(cliente['nombre']![0]),
              ),
              title: Text(cliente['nombre']!),
              subtitle: Text(cliente['ultimoMensaje']!),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatSimulado(nombreCliente: cliente['nombre']!),
                  ),
                );
              },
            );
          },
        ),

        // Floating button fijo en la esquina inferior derecha
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            backgroundColor: Colors.green[300],
            child: Icon(Icons.add_comment),
            tooltip: "Iniciar nuevo chat",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => NuevoChat(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
