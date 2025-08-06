import 'package:flutter/material.dart';

class ChatSimulado extends StatefulWidget {
  final String nombreCliente;

  ChatSimulado({required this.nombreCliente});

  @override
  State<ChatSimulado> createState() => _ChatSimuladoState();
}

class _ChatSimuladoState extends State<ChatSimulado> {
  final TextEditingController _mensajeController = TextEditingController();

  List<Map<String, dynamic>> mensajes = [
    {'remitente': 'cliente', 'texto': 'Hola, ¿a cómo el kilo?'},
    {'remitente': 'agricultor', 'texto': 'Hola! A 25 pesos.'},
    {'remitente': 'cliente', 'texto': 'Perfecto, quiero 3 kilos.'},
  ];

  void enviarMensaje() {
    final texto = _mensajeController.text.trim();
    if (texto.isEmpty) return;

    setState(() {
      mensajes.add({'remitente': 'agricultor', 'texto': texto});
      _mensajeController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nombreCliente),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: mensajes.length,
              itemBuilder: (context, index) {
                final mensaje = mensajes[index];
                final esCliente = mensaje['remitente'] == 'cliente';

                return Align(
                  alignment:
                      esCliente ? Alignment.centerLeft : Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    padding: EdgeInsets.all(12),
                    constraints: BoxConstraints(maxWidth: 260),
                    decoration: BoxDecoration(
                      color: esCliente ? Colors.grey[300] : Colors.green[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      mensaje['texto'],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: Colors.grey[100],
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _mensajeController,
                    decoration: InputDecoration(
                      hintText: "Escribe tu mensaje...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.green[700]),
                  onPressed: enviarMensaje,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
