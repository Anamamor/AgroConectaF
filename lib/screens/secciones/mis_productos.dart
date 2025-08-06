import 'package:flutter/material.dart';

class MisProductosSection extends StatelessWidget {
  final List<Map<String, dynamic>> productosSimulados = [
    {
      "nombre": "Tomates",
      "descripcion": "Tomate rojo fresco",
      "precio": "\$30/kg",
      "cantidad": "10 kg",
      "fecha": "01/08/2025",
      "lugar": "Huerta Los Pinos"
    },
    {
      "nombre": "Elote",
      "descripcion": "Elote blanco listo para asar",
      "precio": "\$5 c/u",
      "cantidad": "50 piezas",
      "fecha": "31/07/2025",
      "lugar": "Rancho El Paraíso"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: productosSimulados.length,
      itemBuilder: (context, index) {
        final producto = productosSimulados[index];
        return Card(
          child: ListTile(
            leading: Icon(Icons.local_florist),
            title: Text(producto["nombre"]),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(producto["descripcion"]),
                Text("Cantidad: ${producto["cantidad"]}"),
                Text("Precio: ${producto["precio"]}"),
                Text("Fecha: ${producto["fecha"]}"),
                Text("Lugar: ${producto["lugar"]}"),
              ],
            ),
          ),
        );
      },
    );
  }
}
