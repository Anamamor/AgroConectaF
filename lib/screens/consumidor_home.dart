import 'package:flutter/material.dart';
import 'consumidor/carrito.dart';
import 'consumidor/favoritos.dart';
import 'consumidor/mensajesconsum.dart';
import 'consumidor/perfil_consumidor.dart';
import 'consumidor/productos.dart';

class ConsumidorHome extends StatefulWidget {
  const ConsumidorHome({Key? key}) : super(key: key);

  @override
  _ConsumidorHomeState createState() => _ConsumidorHomeState();
}

class _ConsumidorHomeState extends State<ConsumidorHome> {
  int _currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  String _searchQuery = '';

  final List<String> nombresProductos = [
    'Jitomate',
    'Pepino',
    'Zanahoria',
    'Lechuga',
    'Cebolla',
    'Papa',
    'Chile',
    'Calabaza',
    'Espinaca',
    'Ajo',
    'Fresa',
    'Cilantro',
    'Nopal',
    'Elote',
    'Manzana',
    'Pera',
    'Durazno',
    'Sandía',
    'Melón',
    'Tomate',
    'Brócoli',
    'Coliflor',
    'Rábano',
    'Apio',
    'Zucchini',
    'Frijol',
    'Maíz',
    'Cebollín',
    'Jengibre',
    'Café',
    'Aguacate',
    'Banana',
    'Limón',
    'Naranja',
    'Mandarina',
    'Chayote',
    'Calabacita',
    'Repollo',
    'Hinojo',
    'Betabel',
    'Chícharo',
    'Mango',
    'Guayaba',
    'Papaya',
    'Piña',
    'Chirimoya',
    'Durazno',
    'Ciruela',
    'Granada',
    'Cereza',
    'Uva',
    'Coco',
    'Nuez',
    'Albahaca',
    'Menta',
    'Orégano',
    'Perejil',
    'Tomillo',
    'Salvia',
    'Lavanda',
    'Rábano',
    'Berro',
    'Col rizada',
    'Achicoria',
    'Espárrago',
    'Chícharo',
    'Calabaza',
    'Zanahoria',
    'Cebolla',
    'Apio',
    'Ajo',
    'Perejil',
    'Cilantro',
    'Lechuga',
    'Pepino',
    'Jitomate',
    'Espinaca',
    'Maíz',
    'Frijol',
    'Chile',
    'Papa',
    'Nopal',
    'Elote',
    'Manzana',
    'Pera',
    'Durazno',
    'Sandía',
    'Melón',
    'Tomate',
    'Brócoli',
    'Coliflor',
    'Rábano',
    'Apio',
    'Zucchini',
    'Cebollín',
  ];

  final List<String> nombresAgricultores = [
    'Juan Pérez',
    'María López',
    'Carlos Martínez',
    'Ana Gómez',
    'Luis Sánchez',
    'Sofía Torres',
    'Miguel Ramírez',
    'Laura Fernández',
    'Pedro Díaz',
    'Marta Herrera',
  ];

  late final List<Producto> _productos;

  final Set<Producto> _favoritos = {};
  final List<ProductoConCantidad> _carrito = [];

  // Lista para guardar los pedidos confirmados
  final List<List<ProductoConCantidad>> _misPedidos = [];

  @override
  void initState() {
    super.initState();
    _productos = List.generate(100, (index) {
      return Producto(
        nombre: nombresProductos[index % nombresProductos.length],
        precio: 10.0 + (index % 20), // Precio entre 10 y 29
        disponibilidad: (index * 3) % 50, // Cantidad variable entre 0 y 49
        agricultor: nombresAgricultores[index % nombresAgricultores.length],
      );
    });

    // Listener para actualizar la búsqueda
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.toLowerCase();
      });
    });
  }

  void _agregarAlCarrito(Producto producto) {
    final index = _carrito.indexWhere((item) => item.producto == producto);
    if (index != -1) {
      // Ya está en el carrito, incrementa cantidad si hay disponibilidad
      if (_carrito[index].cantidad < producto.disponibilidad) {
        setState(() {
          _carrito[index].cantidad++;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'No hay más unidades disponibles de ${producto.nombre}',
            ),
          ),
        );
      }
    } else {
      // No está, lo agrega con cantidad 1
      if (producto.disponibilidad > 0) {
        setState(() {
          _carrito.add(ProductoConCantidad(producto: producto, cantidad: 1));
        });
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Producto no disponible')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      _buildInicioPage(),
      FavoritosPage(favoritos: _favoritos.toList()),
      CarritoPage(
        carrito: _carrito,
        onCompraConfirmada: (compra) {
          setState(() {
            _misPedidos.add(List.from(compra));
            _carrito.clear();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Compra confirmada exitosamente')),
            );
          });
        },
      ),
      const MensajesPage(),
      PerfilConsumidorPage(pedidos: _misPedidos),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Agroconecta"),
        backgroundColor: const Color(0xFFAED581),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFFFFF8E1),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrito',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Mensajes'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }

  Widget _buildInicioPage() {
    final productosFiltrados = _productos.where((producto) {
      return producto.nombre.toLowerCase().contains(_searchQuery);
    }).toList();

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFB9E4C9), Color(0xFFE0F2E9)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar productos...',
                prefixIcon: const Icon(Icons.search, color: Color(0xFF689F38)),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 15,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: productosFiltrados.length,
                itemBuilder: (context, index) {
                  final producto = productosFiltrados[index];
                  final esFavorito = _favoritos.contains(producto);
                  final enCarrito = _carrito.any(
                    (item) => item.producto == producto,
                  );
                  final disponible = producto.disponibilidad > 0;

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        producto.nombre,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Precio: \$${producto.precio.toStringAsFixed(2)}',
                          ),
                          Text(
                            'Disponibles: ${producto.disponibilidad} unidades',
                            style: TextStyle(
                              color: disponible ? Colors.green : Colors.red,
                            ),
                          ),
                          Text('Agricultor: ${producto.agricultor}'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(
                              esFavorito
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: esFavorito ? Colors.red : Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                if (esFavorito) {
                                  _favoritos.remove(producto);
                                } else {
                                  _favoritos.add(producto);
                                }
                              });
                            },
                            tooltip: esFavorito
                                ? 'Quitar de favoritos'
                                : 'Agregar a favoritos',
                          ),
                          IconButton(
                            icon: Icon(
                              enCarrito
                                  ? Icons.shopping_cart
                                  : Icons.add_shopping_cart,
                              color: enCarrito
                                  ? Colors.green
                                  : (disponible
                                        ? Colors.grey
                                        : Colors.grey.shade400),
                            ),
                            onPressed: disponible
                                ? () => _agregarAlCarrito(producto)
                                : null,
                            tooltip: enCarrito
                                ? 'En el carrito'
                                : 'Agregar al carrito',
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
