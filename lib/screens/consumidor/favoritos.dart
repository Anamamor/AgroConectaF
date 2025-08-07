import 'package:flutter/material.dart';
import 'productos.dart';

class FavoritosPage extends StatefulWidget {
  final List<Producto> favoritos;

  const FavoritosPage({Key? key, required this.favoritos}) : super(key: key);

  @override
  State<FavoritosPage> createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos"),
        backgroundColor: const Color(0xFF689F38),
      ),
      body: widget.favoritos.isEmpty
          ? const Center(
              child: Text(
                "No hay productos en favoritos.",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: widget.favoritos.length,
              itemBuilder: (context, index) {
                final producto = widget.favoritos[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    title: Text(
                      producto.nombre,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Precio: \$${producto.precio.toStringAsFixed(2)}'),
                        Text('Disponibles: ${producto.disponibilidad} unidades'),
                        Text('Agricultor: ${producto.agricultor}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.favorite, color: Colors.red),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Eliminar de favoritos'),
                            content: Text(
                                '¿Deseas eliminar "${producto.nombre}" de tus favoritos?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    widget.favoritos.removeAt(index);
                                  });
                                  Navigator.pop(context); // Cierra el diálogo
                                },
                                child: const Text('Eliminar'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
