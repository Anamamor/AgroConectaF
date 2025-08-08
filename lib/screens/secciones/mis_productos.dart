import 'package:flutter/material.dart';

class MisProductosSection extends StatelessWidget {
  final List<Map<String, dynamic>> frutas = List.generate(10, (index) {
    return {
      "nombre": "Fruta ${index + 1}",
      "descripcion": "Fruta fresca y natural",
      "precio": "\$${(15 + index).toStringAsFixed(2)}",
      "imagen":
          "https://cdn-icons-png.flaticon.com/512/415/415733.png", // ícono de fruta
    };
  });

  final List<Map<String, dynamic>> verduras = List.generate(10, (index) {
    return {
      "nombre": "Verdura ${index + 1}",
      "descripcion": "Verdura orgánica del campo",
      "precio": "\$${(10 + index).toStringAsFixed(2)}",
      "imagen":
          "https://cdn-icons-png.flaticon.com/512/415/415734.png", // ícono de verdura
    };
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        color: Color(0xFFF3F5F7), // fondo suave
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black54,
                indicator: BoxDecoration(
                  color: Color(0xFF2E7D32),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                tabs: [
                  Tab(text: "Frutas"),
                  Tab(text: "Verduras"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 480,
              child: TabBarView(
                children: [
                  _buildGrid(frutas),
                  _buildGrid(verduras),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildGrid(List<Map<String, dynamic>> productos) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        itemCount: productos.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          final producto = productos[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    producto["imagen"],
                    height: 60,
                    width: 60,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    producto["nombre"],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFF2E7D32),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    producto["descripcion"],
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  Text(
                    producto["precio"],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
