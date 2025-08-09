import 'package:flutter/material.dart';
import 'productos.dart';

class CarritoPage extends StatefulWidget {
  final List<ProductoConCantidad> carrito;
  final void Function(List<ProductoConCantidad>) onCompraConfirmada;

  const CarritoPage({
    Key? key,
    required this.carrito,
    required this.onCompraConfirmada,
  }) : super(key: key);

  @override
  _CarritoPageState createState() => _CarritoPageState();
}

class _CarritoPageState extends State<CarritoPage> {
  String? _formaPagoSeleccionada;
  String? _metodoEntregaSeleccionado;

  final List<String> _formasPago = [
    'Tarjeta de crédito',
    'PayPal',
    'Pago contra entrega',
  ];

  final List<String> _metodosEntrega = [
    'Entrega a domicilio',
    'Recoger en punto de encuentro',
    'Recoger en finca',
  ];

  void _incrementarCantidad(int index) {
    final productoConCantidad = widget.carrito[index];
    if (productoConCantidad.cantidad <
        productoConCantidad.producto.disponibilidad) {
      setState(() {
        productoConCantidad.cantidad++;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'No hay más unidades disponibles de ${productoConCantidad.producto.nombre}',
          ),
        ),
      );
    }
  }

  void _decrementarCantidad(int index) {
    final productoConCantidad = widget.carrito[index];
    if (productoConCantidad.cantidad > 1) {
      setState(() {
        productoConCantidad.cantidad--;
      });
    } else {
      _eliminarProducto(index);
    }
  }

  void _eliminarProducto(int index) {
    setState(() {
      widget.carrito.removeAt(index);
    });
  }

  double get _total {
    double suma = 0;
    for (var item in widget.carrito) {
      suma += item.producto.precio * item.cantidad;
    }
    return suma;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.carrito.isEmpty) {
      return const Center(child: Text("El carrito está vacío."));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito'),
        backgroundColor: const Color(0xFFAED581),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: widget.carrito.length + 1,
              itemBuilder: (context, index) {
                if (index == widget.carrito.length) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Total: \$${_total.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  );
                }

                final productoConCantidad = widget.carrito[index];

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(
                      productoConCantidad.producto.nombre,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Precio unitario: \$${productoConCantidad.producto.precio.toStringAsFixed(2)}\n'
                      'Disponibles: ${productoConCantidad.producto.disponibilidad}',
                    ),
                    trailing: SizedBox(
                      width: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: () => _decrementarCantidad(index),
                          ),
                          Text('${productoConCantidad.cantidad}'),
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline),
                            onPressed: () => _incrementarCantidad(index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _eliminarProducto(index),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Selector de forma de pago
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                const Text(
                  'Forma de pago:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: DropdownButton<String>(
                    value: _formaPagoSeleccionada,
                    hint: const Text('Selecciona una forma de pago'),
                    isExpanded: true,
                    items: _formasPago.map((forma) {
                      return DropdownMenuItem<String>(
                        value: forma,
                        child: Text(forma),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _formaPagoSeleccionada = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          // Selector de método de entrega
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                const Text(
                  'Método de entrega:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: DropdownButton<String>(
                    value: _metodoEntregaSeleccionado,
                    hint: const Text('Selecciona un método de entrega'),
                    isExpanded: true,
                    items: _metodosEntrega.map((metodo) {
                      return DropdownMenuItem<String>(
                        value: metodo,
                        child: Text(metodo),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _metodoEntregaSeleccionado = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          // Botón para confirmar compra
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: ElevatedButton(
              onPressed:
                  _formaPagoSeleccionada == null ||
                      _metodoEntregaSeleccionado == null ||
                      widget.carrito.isEmpty
                  ? null
                  : () {
                      widget.onCompraConfirmada(widget.carrito);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Compra confirmada con ${widget.carrito.length} productos.\n'
                            'Pago: $_formaPagoSeleccionada\n'
                            'Entrega: $_metodoEntregaSeleccionado',
                          ),
                          duration: const Duration(seconds: 3),
                        ),
                      );
                    },
              child: const Text('Confirmar compra'),
            ),
          ),
        ],
      ),
    );
  }
}
