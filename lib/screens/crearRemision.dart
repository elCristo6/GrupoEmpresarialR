import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: camel_case_types
class crearRemision extends StatelessWidget {
  final int cc;
  final String usuario;
  final TextEditingController descripcionField = TextEditingController();
  final TextEditingController cantidadField = TextEditingController();
  final TextEditingController productoField = TextEditingController();
  List<List<String>> columnasArticulos = [];

  crearRemision({super.key, required this.cc, required this.usuario});

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
                children: [
                  Text(
                    usuario,
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  Text('Identificación: $cc',
                      style:
                          const TextStyle(fontSize: 15, color: Colors.black)),
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
            child: Column(
          children: <Widget>[
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
              children: <Widget>[
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
                SizedBox(height: 16),
                Container(
                    height: 45,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      //borderRadius: BorderRadius.circular(50),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Row(children: const [
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
                Row(
                  children: [
                    Container(
                      width: 290,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                        //borderRadius: BorderRadius.circular(50),
                      ),
                      margin: const EdgeInsets.all(1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(
                              height: 30,
                              child: Text(
                                " Hierro",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          SizedBox(
                              height: 30,
                              child: Text(
                                " Descripcion: Hierro colado y otros hierros.",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              )),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 63,
                          width: 117,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            //borderRadius: BorderRadius.circular(50),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            '1.200KG',
                            style: TextStyle(
                              fontSize: 27,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
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
                              controller: productoField,
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
                              controller: cantidadField,
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
                            color: Colors.black, // Establece el color del icono
                            // Establece el icono a mostrar
                            onPressed: () {
                              // Acción a realizar cuando se presiona el botón
                              /*setState(() {
                                columnasArticulos.add([
                                  productoField.text,
                                  cantidadField.text,
                                  descripcionField.text
                                ]);
                              });*/
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
                  children: [
                    SizedBox(
                      height: 35,
                      width: 410,
                      child: TextField(
                        controller: descripcionField,
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
                    Container(
                      width: 250,
                      margin: const EdgeInsets.all(1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(
                            height: 35,
                            child: TextField(
                              //controller: _textFieldController1,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Despachado por:',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                            child: TextField(
                              //controller: _textFieldController2,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Recibido por:',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: const [
                            SizedBox(
                              height: 35,
                              width: 140,
                              child: Text(
                                'TOTAL KILOS:',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  height: 2.8, //bajar texto
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              height: 35,
                              child: Text(
                                '1.200KG',
                                style: TextStyle(
                                  fontSize: 27,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Center(
                      child: SizedBox(
                        height: 50,
                        width: 390,
                        child: Container(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {
                              // Accion para el boton
                            },
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                  const Size(250, 40)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
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
          ],
        )));
  }
}
