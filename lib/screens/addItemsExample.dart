import 'package:flutter/material.dart';

void main() {
  runApp(example());
}

class example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ejemplo'),
        ),
        body: TextFieldExample(),
      ),
    );
  }
}

class TextFieldExample extends StatefulWidget {
  @override
  _TextFieldExampleState createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  List<List<String>> columnas = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller1,
        ),
        TextField(
          controller: controller2,
        ),
        TextField(
          controller: controller3,
        ),
        ElevatedButton.icon(
          onPressed: () {
            setState(() {
              columnas
                  .add([controller1.text, controller2.text, controller3.text]);
              // limpiamos los campos luego de añadir la información
              controller1.clear();
              controller2.clear();
              controller3.clear();
            });
          },
          icon: Icon(Icons.add),
          label: Text('Agregar columna'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ),
        ),
        // Muestra las columnas agregadas
        for (var columna in columnas)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(columna[0]),
              Text(columna[1]),
              Text(columna[2]),
            ],
          )
      ],
    );
  }
}
