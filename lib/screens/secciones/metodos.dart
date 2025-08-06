import 'package:flutter/material.dart';

class MetodosSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          "Métodos de Pago y Entrega",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 20),
        const ListTile(
          leading: Icon(Icons.credit_card),
          title: Text("Pago en efectivo"),
          subtitle: Text("Pagar al momento de la entrega"),
        ),
        const ListTile(
          leading: Icon(Icons.account_balance),
          title: Text("Transferencia Bancaria"),
          subtitle: Text("CLABE: 012345678901234567"),
        ),
        const Divider(),
        const ListTile(
          leading: Icon(Icons.delivery_dining),
          title: Text("Entrega a domicilio"),
          subtitle: Text("Hasta 10 km desde el campo"),
        ),
        const ListTile(
          leading: Icon(Icons.store_mall_directory),
          title: Text("Entrega en punto de encuentro"),
          subtitle: Text("Parque principal del municipio"),
        ),
      ],
    );
  }
} 