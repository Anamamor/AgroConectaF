// lib/consumidor/productos.dart

class Producto {
  final String nombre;
  final double precio;
  final int disponibilidad;
  final String agricultor;

  Producto({
    required this.nombre,
    required this.precio,
    required this.disponibilidad,
    required this.agricultor,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Producto &&
          runtimeType == other.runtimeType &&
          nombre == other.nombre &&
          agricultor == other.agricultor;

  @override
  int get hashCode => nombre.hashCode ^ agricultor.hashCode;
}

class ProductoConCantidad {
  final Producto producto;
  int cantidad;

  ProductoConCantidad({required this.producto, required this.cantidad});
}
