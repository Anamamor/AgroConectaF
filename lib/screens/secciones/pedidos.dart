import 'package:flutter/material.dart';

class PedidosSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        //Text("Pedidos recibidos", style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: 20),
        ListTile(
          leading: Icon(Icons.receipt),
          title: Text("Pedido #001"),
          subtitle: Text("3kg de Tomate - \$90"),
          trailing: Text("Cliente: Juan"),
        ),
        ListTile(
          leading: Icon(Icons.receipt),
          title: Text("Pedido #002"),
          subtitle: Text("5kg de Maíz - \$150"),
          trailing: Text("Cliente: Ana"),
        ),
      ],
    );
  }
}
