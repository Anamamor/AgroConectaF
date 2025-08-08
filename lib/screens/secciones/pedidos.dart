import 'package:flutter/material.dart';

class PedidosSection extends StatelessWidget {
  final List<Map<String, String>> pedidos = [
    {
      'id': '001',
      'producto': '3kg de Tomate',
      'precio': '\$90',
      'cliente': 'Juan',
      'pago': 'Efectivo',
      'entrega': 'Punto de encuentro: Parque Central',
    },
    {
      'id': '002',
      'producto': '5kg de Maíz',
      'precio': '\$150',
      'cliente': 'Ana',
      'pago': 'Transferencia',
      'entrega': 'Domicilio: Calle 123',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: pedidos.length,
      itemBuilder: (context, index) {
        final pedido = pedidos[index];

        return Card(
          margin: EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pedido #${pedido['id']}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.shopping_bag_outlined),
                    SizedBox(width: 8),
                    Text("${pedido['producto']} - ${pedido['precio']}"),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 8),
                    Text("Cliente: ${pedido['cliente']}"),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.payment),
                    SizedBox(width: 8),
                    Text("Pago: ${pedido['pago']}"),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(width: 8),
                    Expanded(child: Text("Entrega: ${pedido['entrega']}")),
                  ],
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton.icon(
                    icon: Icon(Icons.check_circle_outline),
                    label: Text("Marcar como completado"),
                    onPressed: () {
                      // Simulación de acción
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Pedido #${pedido['id']} marcado como completado."),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
