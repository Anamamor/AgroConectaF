import 'package:flutter/material.dart';

class MetodosSection extends StatefulWidget {
  @override
  _MetodosSectionState createState() => _MetodosSectionState();
}

class _MetodosSectionState extends State<MetodosSection> {
  String numeroTarjeta = "4169 1614 2991 8088";
  String metodoEntrega = "Hasta 10 km desde el campo";
  String puntoEncuentro = "Parque principal del municipio";

  void _editarInfo(String titulo, String valorActual, Function(String) onSave) {
    TextEditingController controller = TextEditingController(text: valorActual);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Editar $titulo"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(labelText: titulo),
        ),
        actions: [
          TextButton(
            child: Text("Cancelar"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: Text("Guardar"),
            onPressed: () {
              onSave(controller.text);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final estiloTitulo = Theme.of(context).textTheme.titleLarge;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        //Text("Métodos de Pago y Entrega", style: estiloTitulo),
        const SizedBox(height: 20),//

        Card(
          child: ListTile(
            leading: Icon(Icons.credit_card),
            title: Text("Pago en efectivo"),
            subtitle: Text("Pagar al momento de la entrega"),
            trailing: Icon(Icons.check_circle, color: Colors.green),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.account_balance),
            title: Text("Transferencia Bancaria"),
            subtitle: Text("CLABE: $numeroTarjeta"),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => _editarInfo("CLABE", numeroTarjeta, (nuevo) {
                setState(() => numeroTarjeta = nuevo);
              }),
            ),
          ),
        ),
        const Divider(height: 30),

        Card(
          child: ListTile(
            leading: Icon(Icons.delivery_dining),
            title: Text("Entrega a domicilio"),
            subtitle: Text(metodoEntrega),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => _editarInfo("Entrega a domicilio", metodoEntrega, (nuevo) {
                setState(() => metodoEntrega = nuevo);
              }),
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.store),
            title: Text("Entrega en punto de encuentro"),
            subtitle: Text(puntoEncuentro),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => _editarInfo("Punto de encuentro", puntoEncuentro, (nuevo) {
                setState(() => puntoEncuentro = nuevo);
              }),
            ),
          ),
        ),
      ],
    );
  }
}
