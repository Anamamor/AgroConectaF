import 'package:flutter/material.dart';
import '../consumidor/productos.dart';

// Importaciones necesarias
import '../metodos_pago.dart';
import '../direcciones_guardadas.dart';
import '../configuracion.dart';
import '../user_selector.dart'; // Asegúrate que este sea el correcto

class PerfilConsumidorPage extends StatefulWidget {
  final List<List<ProductoConCantidad>> pedidos;

  const PerfilConsumidorPage({Key? key, required this.pedidos}) : super(key: key);

  @override
  State<PerfilConsumidorPage> createState() => _PerfilConsumidorPageState();
}

class _PerfilConsumidorPageState extends State<PerfilConsumidorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
        backgroundColor: const Color(0xFF689F38),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xFFB9E4C9),
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              "Yamilet D. Cruz",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Center(
            child: Text(
              "Consumidor",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 30),

          // Mis compras
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text("Mis compras"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => MisComprasPage(pedidos: widget.pedidos),
                ),
              );
            },
          ),

          // Métodos de pago
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text("Métodos de pago"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => MetodosPagoPage()),
              );
            },
          ),

          // Direcciones guardadas
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text("Direcciones guardadas"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => DireccionesGuardadasPage()),
              );
            },
          ),

          // Configuración
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Configuración"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ConfiguracionPage()),
              );
            },
          ),

          const SizedBox(height: 20),

          // Cerrar sesión
          ElevatedButton.icon(
            onPressed: () {
              // Navega al selector de usuario y borra el historial anterior
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => UserSelectorScreen()),
                (route) => false, // Elimina todo del stack
              );
            },
            icon: const Icon(Icons.logout),
            label: const Text("Cerrar sesión"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}

// -------- Página de Mis Compras --------

class MisComprasPage extends StatelessWidget {
  final List<List<ProductoConCantidad>> pedidos;

  const MisComprasPage({Key? key, required this.pedidos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Compras'),
        backgroundColor: const Color(0xFF689F38),
      ),
      body: pedidos.isEmpty
          ? const Center(child: Text('No tienes compras aún'))
          : ListView.builder(
              itemCount: pedidos.length,
              itemBuilder: (context, index) {
                final pedido = pedidos[index];
                double total = pedido.fold(
                  0,
                  (sum, item) => sum + item.producto.precio * item.cantidad,
                );

                return ExpansionTile(
                  title: Text('Pedido #${index + 1} - Total: \$${total.toStringAsFixed(2)}'),
                  children: pedido.map((productoConCantidad) {
                    return ListTile(
                      title: Text(productoConCantidad.producto.nombre),
                      subtitle: Text('Cantidad: ${productoConCantidad.cantidad}'),
                      trailing: Text(
                        '\$${(productoConCantidad.producto.precio * productoConCantidad.cantidad).toStringAsFixed(2)}',
                      ),
                    );
                  }).toList(),
                );
              },
            ),
    );
  }
}
