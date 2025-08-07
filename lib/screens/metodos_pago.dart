import 'package:flutter/material.dart';

class MetodosPagoPage extends StatelessWidget {
  const MetodosPagoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Aquí muestras los métodos de pago del usuario (ejemplo básico)
    return Scaffold(
      appBar: AppBar(
        title: const Text('Métodos de Pago'),
        backgroundColor: const Color(0xFF689F38),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.credit_card),
            title: const Text('Visa **** 1234'),
            subtitle: const Text('Expira 12/25'),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // Aquí podrías implementar eliminar método de pago
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.credit_card),
            title: const Text('MasterCard **** 5678'),
            subtitle: const Text('Expira 08/24'),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              // Aquí puedes agregar método para añadir nuevo método de pago
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Función para agregar método de pago')),
              );
            },
            icon: const Icon(Icons.add),
            label: const Text('Agregar Método de Pago'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF689F38),
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
