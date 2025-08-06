import 'package:flutter/material.dart';
import 'secciones/publicar_producto.dart';
import 'secciones/pedidos.dart';
import 'secciones/metodos.dart';
import 'secciones/mis_productos.dart';
import 'secciones/mensajes.dart';
import 'perfil_panel.dart';

class AgricultorHome extends StatefulWidget {
  @override
  _AgricultorHomeState createState() => _AgricultorHomeState();
}

class _AgricultorHomeState extends State<AgricultorHome> {
  int _currentIndex = 0;

  final List<Widget> _sections = [
    PublicarProductoSection(),
    PedidosSection(),
    MisProductosSection(),
    MetodosSection(),
    MensajesSection(),
  ];

  final List<String> _titles = [
    "Publicar producto",
    "Pedidos",
    "Mis productos",
    "Métodos",
    "Mensajes",
  ];

  // Datos simulados que se pasarán a PerfilPanel
  final Map<String, String> datosAgricultorSimulados = {
    'nombre': 'Juan Pérez',
    'correo': 'juan.perez@mail.com',
    'edad': '38',
    'domicilio': 'Calle Falsa 123',
    'municipio': 'Ciudad Verde',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFB9E4C9), // verde pastel
        foregroundColor: Colors.black87,
        title: Text(
          _titles[_currentIndex],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0.5,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            tooltip: "Perfil",
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) => PerfilPanel(
                  datosAgricultor: datosAgricultorSimulados,
                ),
              );
            },
          )
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _sections[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF4CAF50),
        unselectedItemColor: const Color(0xFFB0BEC5),
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        selectedFontSize: 13,
        unselectedFontSize: 12,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: "Publicar"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: "Pedidos"),
          BottomNavigationBarItem(icon: Icon(Icons.inventory_2_outlined), label: "Mis Productos"),
          BottomNavigationBarItem(icon: Icon(Icons.local_shipping_outlined), label: "Métodos"),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: "Mensajes"),
        ],
      ),
    );
  }
}
