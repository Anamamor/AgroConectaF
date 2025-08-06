import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PublicarProductoSection extends StatefulWidget {
  @override
  _PublicarProductoSectionState createState() => _PublicarProductoSectionState();
}

class _PublicarProductoSectionState extends State<PublicarProductoSection> {
  final _nombre = TextEditingController();
  final _descripcion = TextEditingController();
  final _cantidad = TextEditingController();
  final _precio = TextEditingController();
  final _fecha = TextEditingController();
  final _lugar = TextEditingController();

  File? _imagen; // Aquí guardamos la foto tomada o seleccionada

  final ImagePicker _picker = ImagePicker();

  Future<void> _seleccionarImagen(ImageSource source) async {
    final XFile? foto = await _picker.pickImage(source: source, maxWidth: 600);
    if (foto != null) {
      setState(() {
        _imagen = File(foto.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text("Publicar Producto", style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: 20),

          _imagen == null
              ? Container(
                  width: 150,
                  height: 150,
                  color: Colors.grey[300],
                  child: Icon(Icons.image, size: 80, color: Colors.grey[600]),
                )
              : Image.file(_imagen!, width: 150, height: 150, fit: BoxFit.cover),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                icon: Icon(Icons.camera_alt),
                label: Text("Cámara"),
                onPressed: () => _seleccionarImagen(ImageSource.camera),
              ),
              SizedBox(width: 20),
              ElevatedButton.icon(
                icon: Icon(Icons.photo_library),
                label: Text("Galería"),
                onPressed: () => _seleccionarImagen(ImageSource.gallery),
              ),
            ],
          ),

          SizedBox(height: 20),

          TextField(controller: _nombre, decoration: InputDecoration(labelText: "Nombre del producto")),
          TextField(controller: _descripcion, decoration: InputDecoration(labelText: "Descripción")),
          TextField(controller: _fecha, decoration: InputDecoration(labelText: "Fecha de cosecha")),
          TextField(controller: _lugar, decoration: InputDecoration(labelText: "Lugar")),
          TextField(controller: _cantidad, decoration: InputDecoration(labelText: "Cantidad")),
          TextField(controller: _precio, decoration: InputDecoration(labelText: "Precio")),
          SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Producto simulado publicado")),
              );
            },
            child: Text("Publicar"),
          ),
        ],
      ),
    );
  }
}
