import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grupo_empresarial_r/models/item.dart'; // Reemplaza 'my_app' con el nombre de tu paquete
import 'package:grupo_empresarial_r/providers/items_provider.dart'; // Reemplaza 'my_app' con el nombre de tu paquete
import 'package:provider/provider.dart';

class MiFormulario extends StatefulWidget {
  const MiFormulario({super.key});

  @override
  _MiFormularioState createState() => _MiFormularioState();
}

class _MiFormularioState extends State<MiFormulario> {
  List<String> articulos = [];
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final cantidadController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = '${now.day}-${now.month}-${now.year}';
    String selectedOption = 'Seleccione una empresa';
    List<String> options = [
      'Seleccione una empresa',
      'DIACO S.A',
      'GRUPO REINA',
      'TERIUM',
      'PAZ DEL RIO',
      'SIDOC'
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: const AssetImage(
                  'assets/user.png'), // ruta de la imagen de perfil local
              radius: 35, // radio del círculo de la imagen
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/user.png'),
                    //fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "El Cristo",
                  //usuario,
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
                // Text('Identificación: $cc',
                Text('Identificación: 1022972666',
                    style: const TextStyle(fontSize: 15, color: Colors.black)),
              ],
            )
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize:
              const Size.fromHeight(6.0), // Altura del borde inferior
          child: Container(
            width: double.infinity, // Anchura del borde inferior
            height: 9.0,
            color: Colors.grey, // Color del borde inferior
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: const [
                      Center(
                        child: Text(
                          'Consecutivo NO:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            height: 1.5, //bajar texto
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      Text(
                        '872536',
                        style: TextStyle(fontSize: 28, color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: const [
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 20,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '  $formattedDate',
                        style: const TextStyle(
                          fontSize: 18,
                          height: 1.5, //bajar Texto
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 2),
                child: const Divider(
                  color: Colors.grey,
                  thickness: 3.0,
                ),
              ),
              Row(
                children: const [
                  Text(
                    'EMPRESA',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      //height: 1.5, //bajar texto
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                height: 25,
                width: 380,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                )),
                child: DropdownButton<String>(
                  underline: Container(
                    height: 0,
                    color: Colors.transparent,
                  ),
                  value: selectedOption,
                  onChanged: (newValue) {
                    selectedOption = newValue!;
                  },
                  items: options.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Row(
                children: const [
                  Text(
                    'CIUDAD',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      height: 1.5, //bajar texto
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 25,
                    width: 370,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    )),
                    child: const TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10.0), // Define e
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: const [
                  Text(
                    'TRANSPORTADOR',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      height: 1.5, //bajar texto
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 25,
                    width: 370,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    )),
                    child: const TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        //hintText: 'CIUDAD',
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10.0), // Define e
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: const [
                  Text(
                    'CEDULA TRANSPORTADOR',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      height: 1.5, //bajar texto
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 25,
                    width: 370,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    )),
                    child: const TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        //hintText: 'CIUDAD',
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10.0), // Define e
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: const [
                  Text(
                    'DIRECCION',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      height: 1.5, //bajar texto
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 25,
                    width: 370,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    )),
                    child: const TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        //hintText: 'CIUDAD',
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10.0), // Define e
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: const [
                  Text(
                    'PLACA DEL VEHICULO',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      height: 1.5, //bajar texto
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 25,
                    width: 370,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    )),
                    child: const TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        // hintText: 'CIUDAD',
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10.0), // Define e
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Column(
                children: articulos.map((articulo) {
                  return Row(
                    children: [
                      Container(
                        height: 64,
                        width: 220,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(
                            color: Colors.grey,
                            //width: 2,
                          ),
                        ),
                        //margin: const EdgeInsets.all(1),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                              child: Text(
                                "articulo.name",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: Text(
                                "articulo.description",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 64,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          " KG",
                          // "50",
                          style: TextStyle(
                            fontSize: 27,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  );
                }).toList(),
              ),
              Row(
                children: [
                  /*Expanded(
                      child: TextField()), // Primer TextField para el artículo
                  Expanded(
                      child: TextField()), // Segundo TextField para el artículo*/
                  Expanded(
                    child: SizedBox(
                      height: 35,
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Producto',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 80.0), // Define el ancho deseado aquí
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 34,
                    width: 109,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add_circle_outlined),
                      color: Colors.black, // Establece el color del icono
                      // Establece el icono a mostrar
                      onPressed: () {
                        /*final name = nameController.text;
                        final description = descriptionController.text;
                        final cantidad = cantidadController;
                        if (name.isNotEmpty && description.isNotEmpty) {
                          int cantidad = int.parse(cantidadController.text);
                          final item = Item(name, description, cantidad);
                          Provider.of<ItemsProvider>(context, listen: false)
                              .addItem(item);
                        }*/

                        nameController.clear();
                        descriptionController.clear();
                        cantidadController.clear();
                        setState(() {
                          articulos.add('Artículo: ${articulos.length + 1}');
                        });
                      },
                    ),
                  ),

                  /*
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        articulos.add('Artículo: ${articulos.length + 1}');
                      });
                    },
                    child: Text('Agregar'),
                  ),*/
                ],
              ),
              Row(
                children: [
                  /*Expanded(
                      child: TextField()), // Primer TextField para el artículo
                  Expanded(
                      child: TextField()), // Segundo TextField para el artículo*/
                  Expanded(
                    child: SizedBox(
                      height: 35,
                      child: TextField(
                        controller: cantidadController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter
                              .digitsOnly //para que solo ingrese numeros
                        ],
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Cantidad (KG)',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 80.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(
                        color: Colors
                            .green, // Establece el color del borde en rojo
                        width: 2.0, // Establece el ancho del borde en 2 puntos
                      ),
                      //borderRadius: BorderRadius.circular(50),
                    ),
                    padding: const EdgeInsets.all(6.5),
                    child: Row(
                      children: const [Text('Añadir articulo')],
                    ),
                  ),

                  /*
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        articulos.add('Artículo: ${articulos.length + 1}');
                      });
                    },
                    child: Text('Agregar'),
                  ),*/
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Descripcion del articulo (Opcional)',
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 80.0), // Define el ancho deseado aquí
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Center(
                    child: SizedBox(
                      height: 50,
                      width: 370,
                      child: Container(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {
                            // Accion para el boton
                          },
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(const Size(250, 40)),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.save_outlined),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Guardar',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final cantidadController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = '${now.day}-${now.month}-${now.year}';
    String selectedOption = 'Seleccione una empresa';
    List<String> options = [
      'Seleccione una empresa',
      'DIACO S.A',
      'GRUPO REINA',
      'TERIUM',
      'PAZ DEL RIO',
      'SIDOC'
    ];
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: Column(children: [
              Row(
                children: [
                  Column(
                    children: const [
                      Center(
                        child: Text(
                          '    Consecutivo NO:',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            height: 1.5, //bajar texto
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20), // espacios en blanco
                  Column(
                    children: const [
                      Center(
                        child: Text(
                          '872536',
                          style: TextStyle(fontSize: 28, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: const [
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 20,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Center(
                          child: Text(
                        '  $formattedDate',
                        style: const TextStyle(
                          fontSize: 18,
                          height: 1.5, //bajar Texto
                        ),
                      ))
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 2),
                child: const Divider(
                  color: Colors.grey,
                  thickness: 3.0,
                ),
              ),
              Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        '   EMPRESA',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          //height: 1.5, //bajar texto
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 25,
                        width: 380,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        )),
                        child: DropdownButton<String>(
                          underline: Container(
                            height: 0,
                            color: Colors.transparent,
                          ),
                          value: selectedOption,
                          onChanged: (newValue) {
                            selectedOption = newValue!;
                          },
                          items: options
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        '   CIUDAD',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          height: 1.5, //bajar texto
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 25,
                        width: 380,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        )),
                        child: const TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            //hintText: 'CIUDAD',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0), // Define e
                            border: OutlineInputBorder(),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        '   TRANSPORTADOR',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          height: 1.5, //bajar texto
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 25,
                        width: 380,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        )),
                        child: const TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            //hintText: 'CIUDAD',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0), // Define e
                            border: OutlineInputBorder(),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        '   Cedula de ciudadania',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          height: 1.5, //bajar texto
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 25,
                        width: 380,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        )),
                        child: const TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            //hintText: 'CIUDAD',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0), // Define e
                            border: OutlineInputBorder(),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        '    Direccion',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          height: 1.5, //bajar texto
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 25,
                        width: 380,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        )),
                        child: const TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            //hintText: 'CIUDAD',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0), // Define e
                            border: OutlineInputBorder(),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        '    Placa del Vehiculo',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          height: 1.5, //bajar texto
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 25,
                        width: 380,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        )),
                        child: const TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            // hintText: 'CIUDAD',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0), // Define e
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16)
                ],
              )
            ]),
          ),
          Expanded(
            child: Consumer<ItemsProvider>(
              builder: (context, itemsProvider, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: itemsProvider.items.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == itemsProvider.items.length) {
                      // Último elemento, renderizar los campos de entrada y el botón
                      return Column(children: [
                        Row(
                          children: [
                            Container(
                              width: 300,
                              margin: const EdgeInsets.all(1),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 35,
                                    child: TextField(
                                      controller: nameController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Producto',
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal:
                                                80.0), // Define el ancho deseado aquí
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 35,
                                    child: TextField(
                                      controller: cantidadController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter
                                            .digitsOnly //para que solo ingrese numeros
                                      ],
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Cantidad (KG)',
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 80.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 34,
                                  width: 109,
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                  ),
                                  child: IconButton(
                                    icon: const Icon(Icons.add_circle_outlined),
                                    color: Colors
                                        .black, // Establece el color del icono
                                    // Establece el icono a mostrar
                                    onPressed: () {
                                      final name = nameController.text;
                                      final description =
                                          descriptionController.text;
                                      final cantidad = cantidadController;
                                      if (name.isNotEmpty &&
                                          description.isNotEmpty) {
                                        int cantidad =
                                            int.parse(cantidadController.text);
                                        final item =
                                            Item(name, description, cantidad);
                                        Provider.of<ItemsProvider>(context,
                                                listen: false)
                                            .addItem(item);
                                      }
                                      nameController.clear();
                                      descriptionController.clear();
                                      cantidadController.clear();
                                    },
                                  ),
                                ),
                                Container(
                                  height: 36,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    border: Border.all(
                                      color: Colors
                                          .green, // Establece el color del borde en rojo
                                      width:
                                          2.0, // Establece el ancho del borde en 2 puntos
                                    ),
                                    //borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: const EdgeInsets.all(6.5),
                                  child: Row(
                                    children: const [Text('Añadir articulo')],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          //fila de descripcion del articulo
                          children: [
                            SizedBox(
                              height: 35,
                              width: 410,
                              child: TextField(
                                controller: descriptionController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText:
                                      'Descripcion del articulo (Opcional)',
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal:
                                          80.0), // Define el ancho deseado aquí
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]);
                    }

                    final item = itemsProvider.items[index];
                    return Row(
                      children: [
                        Container(
                          height: 64,
                          width: 250,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            border: Border.all(
                              color: Colors.grey,
                              //width: 2,
                            ),
                          ),
                          //margin: const EdgeInsets.all(1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                                child: Text(
                                  item.name,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                                child: Text(
                                  item.description,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 64,
                          width: 157,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            ' ${item.cantidad.toString()} KG',
                            // "50",
                            style: TextStyle(
                              fontSize: 27,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
