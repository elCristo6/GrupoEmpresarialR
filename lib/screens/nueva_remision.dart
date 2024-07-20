import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gruporv3/models/articulos.dart';
import 'package:gruporv3/models/remision.dart';
import 'package:gruporv3/models/usercc.dart';

import '../services/remision_service.dart';

class MiFormulario extends StatefulWidget {
  final int cc;
  final String usuario;
  const MiFormulario({super.key, required this.cc, required this.usuario});

  @override
  // ignore: library_private_types_in_public_api
  _MiFormularioState createState() => _MiFormularioState();
}

class _MiFormularioState extends State<MiFormulario> {
  List<Remision> remisionList = [];
  List<Articulo> articulosList = [];
  final remisionService = RemisionService();
  double totalCantidad = 0;

  TextEditingController ciudadController = TextEditingController();
  TextEditingController transportadorController = TextEditingController();
  TextEditingController ccTransportadorController = TextEditingController();
  TextEditingController direccionController = TextEditingController();
  TextEditingController placaController = TextEditingController();
  TextEditingController despachadoController = TextEditingController();
  TextEditingController recibidoController = TextEditingController();
  TextEditingController productoController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController cantidadController = TextEditingController();

  final userNewMessage =
      const SnackBar(content: Text('Factura creada correctamente'));
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadLastRemisionId();
  }

  Future<void> crearNuevaRemision() async {
    Remision remision = Remision(
      ciudad: ciudadController.text,
      transportador: transportadorController.text,
      ccTransportador: ccTransportadorController.text,
      direccion: direccionController.text,
      placa: placaController.text,
      despachado: despachadoController.text,
      recibido: recibidoController.text,
      totalPeso:
          totalCantidad, // Coloca el valor correcto de acuerdo a tus necesidades
      empresa: selectedOption,
      userCC: UserCC(
          cc: widget.cc
              .toString()), // Reemplaza con la instancia adecuada de UserCC si es necesario
      articulos:
          articulosList, // Reemplaza con la lista de Articulo correspondiente
      createdAt: DateTime
          .now(), // Coloca el valor correcto de acuerdo a tus necesidades
      updatedAt: DateTime
          .now(), // Coloca el valor correcto de acuerdo a tus necesidades
    );

    try {
      // ignore: unused_local_variable
      final nuevaRemision = await remisionService.crearRemision(remision);
      //print('Remisión creada correctamente: ${nuevaRemision.id}');
    } catch (e) {
      //print('Error al crear la remisión: $e');
    }
  }

  void agregarArticul() {
    String nombre = productoController.text;
    String descripcion = descriptionController.text;
    String cantidad = cantidadController.text;
    //int cantidadInt = int.parse(cantidad); // Convertir a valor entero

    Articulo articulo = Articulo(
      material: nombre,
      cantidad: int.parse(cantidad),
      descripcion: descripcion,
    );

    setState(() {
      articulosList.add(articulo);
      totalCantidad += articulo.cantidad;
      productoController.clear();
      descriptionController.clear();
      cantidadController.clear();
    });
  }

  int? ultimoIdRemision;

  void loadLastRemisionId() async {
    List<Remision> todasLasRemisiones =
        await remisionService.getTodasLasRemisiones();
    int ultimoId =
        todasLasRemisiones[0].id!; // Obtiene el último ID de remisión

    // ignore: avoid_function_literals_in_foreach_calls
    todasLasRemisiones.forEach((remision) {
      if (remision.id!.compareTo(ultimoId) > 0) {
        ultimoId = remision.id!;
      }
    });

    setState(() {
      ultimoIdRemision =
          ultimoId + 1; // Incrementa el último ID de remisión por uno
    });
  }

  final camposVacios =
      const SnackBar(content: Text('Tienes que ingresar algun producto'));

  String selectedOption = 'Seleccione una empresa';
  List<String> options = [
    'Seleccione una empresa',
    'DIACO S.A',
    'GRUPO REINA',
    'TERNIUM-COOPERMA',
    'TERNIUM-COREMTERCAM',
    'PAZ DEL RIO',
    'SIDOC-COREMTERCAM',
    'SIDOC-COOPERMA'
  ];
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = '${now.day}-${now.month}-${now.year}';

    final int cc = widget.cc;
    final String usuario = widget.usuario;

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  //"El Cristo",
                  usuario,
                  style: const TextStyle(fontSize: 22, color: Colors.black),
                ),
                Text('Identificación: $cc',
                    //Text('Identificación: 1022972666',
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
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Consecutivo NO:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      height: 1.5, //bajar texto
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    //'872536',
                    '${ultimoIdRemision ?? ''}',
                    style: const TextStyle(fontSize: 25, color: Colors.black),
                  ),
                  const SizedBox(width: 20),
                  const Icon(
                    Icons.calendar_month_outlined,
                    size: 18,
                  ),
                  Text(
                    '  $formattedDate',
                    style: const TextStyle(
                      fontSize: 18,
                      height: 1.5, //bajar Texto
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 2),
                child: const Divider(
                  color: Colors.grey,
                  thickness: 3.0,
                ),
              ),
              const Row(children: [
                Text(
                  'EMPRESA',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    //height: 1.5, //bajar texto
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
              Container(
                width: double.infinity, // Ancho personalizado
                height: 25, // Alto personalizado
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                )),
                child: DropdownButton<String>(
                  //isExpanded: true,
                  hint: const Text('Seleccione una opción'),
                  underline: Container(
                    height: 10,
                    color: Colors.transparent,
                  ),
                  value: selectedOption,
                  onChanged: (newValue) {
                    setState(() {
                      selectedOption = newValue!;
                    });
                  },
                  items: options.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const Row(
                children: [
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
              Container(
                width: double.infinity, // Ancho personalizado
                height: 25, // Alto personalizado
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                )),
                child: TextField(
                  controller: ciudadController,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.0), // Define e
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Row(
                children: [
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
              Container(
                width: double.infinity, // Ancho personalizado
                height: 25,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                )),
                child: TextField(
                  controller: transportadorController,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: const InputDecoration(
                    //hintText: 'CIUDAD',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.0), // Define e
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Row(
                children: [
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
              Container(
                width: double.infinity, // Ancho personalizado
                height: 25,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                )),
                child: TextField(
                  controller: ccTransportadorController,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: const InputDecoration(
                    //hintText: 'CIUDAD',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.0), // Define e
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Row(
                children: [
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
              Container(
                width: double.infinity, // Ancho personalizado
                height: 25,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                )),
                child: TextField(
                  controller: direccionController,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: const InputDecoration(
                    //hintText: 'CIUDAD',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.0), // Define e
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Row(
                children: [
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
              Container(
                width: double.infinity, // Ancho personalizado
                height: 25,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                )),
                child: TextField(
                  controller: placaController,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: const InputDecoration(
                    // hintText: 'CIUDAD',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.0), // Define e
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                  // width: double.infinity, // Ancho personalizado
                  //height: 45,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    //borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Row(children: [
                    SizedBox(width: 16),
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
                    Text(
                      " Articulos",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ])),

              /////lista de articulos//////
              // const SizedBox(height: 1),
              ListView.builder(
                shrinkWrap: true,
                itemCount: articulosList.length,
                itemBuilder: (context, index) {
                  Articulo articulo = articulosList[index];
                  //totalCantidad += articulo.cantidad;
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                articulo.material,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                articulo.descripcion,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //SizedBox(width: 1),
                        Container(
                          height: 72,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "${articulo.cantidad} kg",
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              //SizedBox(height: 100),
              //Contenedor de producto, cantidad y boton +//
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Row(
                    children: [
                      Expanded(
                        //flex: 1,
                        child: SizedBox(
                          height: 35,
                          child: TextField(
                            controller: productoController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Producto',
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal:
                                      40.0), // Define el ancho deseado aquí
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 35,
                        width: 112,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(
                            color: Colors
                                .green, // Establece el color del borde en rojo
                            width:
                                0, // Establece el ancho del borde en 2 puntos
                          ),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.add_circle_outlined),
                          color: Colors.black, // Establece el color del icono
                          // Establece el icono a mostrar
                          onPressed: () {
                            if (cantidadController.text.isEmpty ||
                                productoController.text.isEmpty ||
                                descriptionController.text.isEmpty) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(camposVacios);
                            } else {
                              agregarArticul();
                            }
                          },
                        ),
                      ),
                    ],
                  )),

              ///contenedor de cantidad (KG) y añadir articulos
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Row(
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
                                  EdgeInsets.symmetric(horizontal: 40.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 35,
                        width: 112,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(
                            color: Colors
                                .green, // Establece el color del borde en rojo
                            width:
                                0, // Establece el ancho del borde en 2 puntos
                          ),
                          //borderRadius: BorderRadius.circular(50),
                        ),
                        padding: const EdgeInsets.all(9),
                        child: const Row(
                          children: [
                            Text(
                              'Añadir articulo',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                //fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Descripcion del articulo (Opcional)',
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 40.0), // Define el ancho deseado aquí
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 35,
                          child: TextField(
                            controller: despachadoController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Despachado por:',
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 35,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 10),
                        child: const Row(
                          children: [
                            Text(
                              'TOTAL KILOS',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                //fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 35,
                          child: TextField(
                            controller: recibidoController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Recibido por:',
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 35,
                        // width: 112,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: Row(
                          children: [
                            Text(
                              '${totalCantidad.toInt()} kg',
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                  child: Row(
                    children: [
                      Center(
                        child: TextButton(
                          onPressed: () {
                            // Accion para el boton
                            crearNuevaRemision();
                            Navigator.pop(context, true);
                            //_newUserInput.clear();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(userNewMessage);
                          },
                          style: ButtonStyle(
                            minimumSize:
                                WidgetStateProperty.all(const Size(250, 40)),
                            backgroundColor:
                                WidgetStateProperty.all<Color>(Colors.black),
                            foregroundColor:
                                WidgetStateProperty.all<Color>(Colors.white),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
