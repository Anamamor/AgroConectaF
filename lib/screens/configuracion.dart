import 'package:flutter/material.dart';

class ConfiguracionPage extends StatelessWidget {
  const ConfiguracionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
        backgroundColor: const Color(0xFF689F38),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SwitchListTile(
            title: const Text('Notificaciones'),
            subtitle: const Text('Activar o desactivar notificaciones'),
            value: true,
            onChanged: (val) {
              // Aquí puedes guardar el cambio de estado
            },
          ),
          ListTile(
            title: const Text('Cambiar contraseña'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Aquí navega a pantalla para cambiar contraseña
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Función para cambiar contraseña')),
              );
            },
          ),
          ListTile(
            title: const Text('Idioma'),
            trailing: const Text('Español'),
            onTap: () {
              // Aquí puedes abrir opciones de idioma
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Función para cambiar idioma')),
              );
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              // Aquí podrías hacer alguna acción de restablecer configuración o similar
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Configuración restablecida')),
              );
            },
            icon: const Icon(Icons.restore),
            label: const Text('Restablecer configuración'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
