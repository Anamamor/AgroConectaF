import 'package:flutter/material.dart';

class DireccionesGuardadasPage extends StatelessWidget {
  const DireccionesGuardadasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ejemplo básico con direcciones guardadas
    final direcciones = [
      'Calle Falsa 123, Ciudad, País',
      'Avenida Siempre Viva 742, Ciudad, País',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Direcciones Guardadas'),
        backgroundColor: const Color(0xFF689F38),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: direcciones.length,
        itemBuilder: (context, index) {
          final direccion = direcciones[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(direccion),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  // Aquí podrías implementar eliminar dirección
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF689F38),
        child: const Icon(Icons.add),
        onPressed: () {
          // Aquí puedes añadir lógica para agregar nueva dirección
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Función para agregar dirección')),
          );
        },
      ),
    );
  }
}
