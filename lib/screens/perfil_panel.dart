import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PerfilPanel extends StatefulWidget {
  final Map<String, String> datosAgricultor;

  const PerfilPanel({required this.datosAgricultor, Key? key}) : super(key: key);

  @override
  State<PerfilPanel> createState() => _PerfilPanelState();
}

class _PerfilPanelState extends State<PerfilPanel> {
  late TextEditingController nombreController;
  late TextEditingController correoController;
  late TextEditingController edadController;
  late TextEditingController domicilioController;
  late TextEditingController municipioController;

  File? _imagen;

  @override
  void initState() {
    super.initState();
    nombreController = TextEditingController(text: widget.datosAgricultor['nombre']);
    correoController = TextEditingController(text: widget.datosAgricultor['correo']);
    edadController = TextEditingController(text: widget.datosAgricultor['edad']);
    domicilioController = TextEditingController(text: widget.datosAgricultor['domicilio']);
    municipioController = TextEditingController(text: widget.datosAgricultor['municipio']);
  }

  @override
  void dispose() {
    nombreController.dispose();
    correoController.dispose();
    edadController.dispose();
    domicilioController.dispose();
    municipioController.dispose();
    super.dispose();
  }

  Future<void> _elegirImagen() async {
    final picker = ImagePicker();
    final XFile? imagen = await picker.pickImage(source: ImageSource.gallery);
    if (imagen != null) {
      setState(() => _imagen = File(imagen.path));
    }
  }

  void _guardarCambios() {
    // Aquí puedes enviar los datos a BD, o guardar localmente
    // Por ahora sólo mostramos un SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cambios guardados exitosamente')),
    );
    // Opcionalmente: cerrar panel o hacer algo más
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        top: 20,
        left: 20,
        right: 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Perfil del Agricultor",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: _elegirImagen,
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Colors.grey[300],
                backgroundImage: _imagen != null ? FileImage(_imagen!) : null,
                child: _imagen == null ? Icon(Icons.camera_alt, size: 30, color: Colors.grey[700]) : null,
              ),
            ),
            const SizedBox(height: 10),

            // Campos editables
            TextFormField(
              controller: nombreController,
              decoration: const InputDecoration(labelText: "Nombre"),
            ),
            TextFormField(
              controller: correoController,
              decoration: const InputDecoration(labelText: "Correo"),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              controller: edadController,
              decoration: const InputDecoration(labelText: "Edad"),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: domicilioController,
              decoration: const InputDecoration(labelText: "Domicilio"),
            ),
            TextFormField(
              controller: municipioController,
              decoration: const InputDecoration(labelText: "Municipio"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _guardarCambios,
              child: const Text("Guardar Cambios"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green[300]),
            ),
          ],
        ),
      ),
    );
  }
}
