import 'package:flutter/material.dart';

class ChatSimulado extends StatefulWidget {
  final String nombre;

  const ChatSimulado({Key? key, required this.nombre}) : super(key: key);

  @override
  State<ChatSimulado> createState() => _ChatSimuladoState();
}

class _ChatSimuladoState extends State<ChatSimulado> {
  final List<Map<String, dynamic>> mensajes = [
    {'texto': '¡Hola!', 'esUsuario': false},
    {'texto': '¿Tienes jitomate bola?', 'esUsuario': true},
    {'texto': 'Sí, me queda 1 caja disponible.', 'esUsuario': false},
  ];

  final TextEditingController controladorMensaje = TextEditingController();

  void enviarMensaje(String texto) {
    if (texto.trim().isEmpty) return;

    setState(() {
      mensajes.add({'texto': texto, 'esUsuario': true});
    });

    controladorMensaje.clear();

    // Respuesta automática personalizada basada en el mensaje
    Future.delayed(const Duration(milliseconds: 700), () {
      final respuesta = generarRespuesta(texto);
      setState(() {
        mensajes.add({'texto': respuesta, 'esUsuario': false});
      });
    });
  }

 String generarRespuesta(String mensaje) {
  final texto = mensaje.toLowerCase();

  // Lista de productos que vendes
  final List<String> productos = [
    'jitomate', 'tomate', 'pepino', 'lechuga', 'zanahoria', 'cebolla',
    'papa', 'calabaza', 'chile jalapeño', 'chile serrano', 'chile poblano',
    'aguacate', 'limón', 'naranja', 'plátano', 'manzana', 'pera', 'mango',
    'piña', 'sandía', 'melón', 'espinaca', 'brócoli', 'coliflor', 'col',
    'betabel', 'rábano', 'cilantro', 'perejil', 'apio', 'ejote', 'elote',
    'pepino persa', 'camote', 'yuca', 'jengibre', 'ajo', 'huevo',
  ];

  // Detección de producto
  String? productoEncontrado;
  for (var producto in productos) {
    if (texto.contains(producto)) {
      productoEncontrado = producto;
      break;
    }
  }

  // Tipos de pregunta (intención)
  final bool preguntaPrecio = texto.contains('precio') || texto.contains('cuánto cuesta');
  final bool preguntaDisponibilidad = texto.contains('tienes') || texto.contains('disponible') || texto.contains('hay');
  final bool preguntaEntrega = texto.contains('entrega') || texto.contains('envío');
  final bool saludo = texto.contains('hola') || texto.contains('buenos días') || texto.contains('buenas tardes') || texto.contains('buenas noches');
  final bool agradecimiento = texto.contains('gracias') || texto.contains('muchas gracias');

  if (saludo) {
    return '¡Hola! ¿En qué puedo ayudarte con nuestros productos?';
  }

  if (agradecimiento) {
    return '¡Con gusto! Estoy para ayudarte cuando quieras.';
  }

  if (productoEncontrado != null) {
    if (preguntaPrecio) {
      // Respuesta de precios para productos
      return 'El precio del $productoEncontrado varía según la temporada y cantidad. ¿Cuánto necesitas?';
    } else if (preguntaDisponibilidad) {
      return 'Sí, tenemos $productoEncontrado fresco y disponible.';
    } else if (preguntaEntrega) {
      return 'Hacemos entrega a domicilio para $productoEncontrado, pregunta por zonas y horarios.';
    } else {
      // Respuesta genérica si solo menciona el producto
      return 'Sí, tenemos $productoEncontrado en inventario. ¿Quieres saber precio o disponibilidad?';
    }
  } else {
    // Respuestas genéricas para otras preguntas
    if (preguntaEntrega) {
      return 'Hacemos entregas de lunes a sábado por las mañanas.';
    }
    if (preguntaPrecio) {
      return 'Para cotizar un precio, dime qué producto te interesa.';
    }
    if (preguntaDisponibilidad) {
      return 'Dime qué producto necesitas para verificar disponibilidad.';
    }

    return 'No entendí bien tu mensaje. ¿Podrías reformularlo o especificar el producto?';
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat con ${widget.nombre}"),
        backgroundColor: const Color(0xFFB9E4C9),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: mensajes.length,
              itemBuilder: (context, index) {
                final mensaje = mensajes[index];
                final bool esUsuario = mensaje['esUsuario'];

                return Align(
                  alignment:
                      esUsuario ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: esUsuario
                          ? const Color(0xFF689F38)
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      mensaje['texto'],
                      style: TextStyle(
                          color: esUsuario ? Colors.white : Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controladorMensaje,
                    decoration: const InputDecoration(
                      hintText: "Escribe un mensaje...",
                      border: InputBorder.none,
                    ),
                    onSubmitted: enviarMensaje,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Color(0xFF689F38)),
                  onPressed: () => enviarMensaje(controladorMensaje.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
