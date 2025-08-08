import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PublicarProductoSection extends StatefulWidget {
  @override
  _PublicarProductoSectionState createState() => _PublicarProductoSectionState();
}

class _PublicarProductoSectionState extends State<PublicarProductoSection> {
  final _formKey = GlobalKey<FormState>();

  final _nombre = TextEditingController();
  final _descripcion = TextEditingController();
  final _cantidad = TextEditingController();
  final _precio = TextEditingController();
  final _fecha = TextEditingController();
  final _lugar = TextEditingController();
  String? _categoriaSeleccionada;

  File? _imagen;
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
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
           
            const SizedBox(height: 20),

            // Imagen del producto
            InkWell(
              onTap: () => _seleccionarImagen(ImageSource.gallery),
              child: CircleAvatar(
                radius: 75,
                backgroundColor: Colors.grey[300],
                backgroundImage: _imagen != null ? FileImage(_imagen!) : null,
                child: _imagen == null
                    ? Icon(Icons.image, size: 50, color: Colors.grey[600])
                    : null,
              ),
            ),
            const SizedBox(height: 10),

            // Botones de selección
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  onPressed: () => _seleccionarImagen(ImageSource.camera),
                  icon: Icon(Icons.camera_alt, color: Color(0xFF2E7D32)),
                  label: Text("Cámara", style: TextStyle(color: Color(0xFF2E7D32))),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color(0xFF2E7D32)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(width: 12),
                OutlinedButton.icon(
                  onPressed: () => _seleccionarImagen(ImageSource.gallery),
                  icon: Icon(Icons.photo_library, color: Color(0xFF2E7D32)),
                  label: Text("Galería", style: TextStyle(color: Color(0xFF2E7D32))),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color(0xFF2E7D32)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Campos de texto
            _buildInput(_nombre, "Nombre del producto"),
            _buildInput(_descripcion, "Descripción"),
            _buildInput(_fecha, "Fecha de cosecha"),
            _buildInput(_lugar, "Lugar"),
            _buildInput(_cantidad, "Cantidad"),
            _buildInput(_precio, "Precio"),

            // Selector de categoría
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Categoría",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              value: _categoriaSeleccionada,
              items: ["Fruta", "Verdura"].map((cat) {
                return DropdownMenuItem(value: cat, child: Text(cat));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _categoriaSeleccionada = value;
                });
              },
              validator: (value) => value == null ? "Selecciona una categoría" : null,
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: _publicarProducto,
              icon: Icon(Icons.upload),
              label: Text("Publicar"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2E7D32),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        validator: (value) => value == null || value.isEmpty ? "Campo obligatorio" : null,
      ),
    );
  }

  void _publicarProducto() {
    if (_formKey.currentState!.validate()) {
      // Aquí podrías agregar lógica para insertar en lista de frutas o verduras
      String categoria = _categoriaSeleccionada ?? "Fruta";

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Producto publicado como $categoria")),
      );

      // Reset
      _formKey.currentState!.reset();
      _nombre.clear();
      _descripcion.clear();
      _cantidad.clear();
      _precio.clear();
      _fecha.clear();
      _lugar.clear();
      _imagen = null;
      _categoriaSeleccionada = null;
      setState(() {});
    }
  }
}
