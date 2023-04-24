import 'package:flutter/material.dart';
import 'package:grupo_empresarial_r/screens/crearRemision.dart';

// ignore: camel_case_types
class provedores extends StatelessWidget {
  const provedores({super.key});

  @override
  Widget build(BuildContext context) {
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
                    'Proveedor 1',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  Text('Identificación: 123456789',
                      style: TextStyle(fontSize: 15, color: Colors.black)),
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
            children: [
              Row(
                children: const [
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    'Historial de remisiones',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      height: 1.7, //bajar texto
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: const [
                      Text(
                        'FECHA',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          height: 1.5, //bajar texto
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  Column(
                    children: const [
                      Text(
                        'EMPRESA',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          height: 1.5, //bajar texto
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 55,
                  ),
                  Column(
                    children: const [
                      Text(
                        'CONSECUTIVO',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          height: 1.5, //bajar texto
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onLongPressStart: (LongPressStartDetails details) {
                        final RenderBox box =
                            context.findRenderObject() as RenderBox;
                        final Offset localPosition =
                            box.globalToLocal(details.globalPosition);

                        showMenu(
                          context: context,
                          position: RelativeRect.fromLTRB(
                            localPosition.dx,
                            localPosition.dy,
                            localPosition.dx + 1,
                            localPosition.dy + 1,
                          ),
                          items: <PopupMenuEntry>[
                            PopupMenuItem(
                              child: Row(
                                children: const [
                                  Icon(Icons.print),
                                  SizedBox(width: 10),
                                  Text('IMPRESION')
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              child: Row(
                                children: const [
                                  Icon(Icons.qr_code_2),
                                  SizedBox(width: 10),
                                  Text('GENERAR QR')
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 228, 226, 226),
                          border: Border.all(
                            color: const Color.fromARGB(255, 196, 196, 196),
                            width: 1.0,
                          ),
                        ),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: const [
                                    Text(
                                      'Enero',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        height: 1.5, //bajar texto
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      '10',
                                      style: TextStyle(
                                        fontSize: 35,
                                        color: Colors.black,
                                        height: 1, //bajar texto
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(width: 70),
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: const [
                                      Text(
                                        'DIACO S.A',
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.black,
                                          height: 1.7, //bajar texto
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Text(
                                        'NIT: 123456789-6',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          height: 0.9, //bajar texto
                                          //fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(width: 40),
                            const Text(
                              '01258',
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.black,
                                //height: 1.5, //bajar texto
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
              const SizedBox(
                height: 400,
              ),
              TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          // builder: (context) => const crearRemision()),
                          builder: (context) => const crearRemision()),
                    );
                  },
                  icon: const Icon(Icons.add),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(370, 50)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  label: const Text(
                    'Crear remision',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      //height: 1.5, //bajar texto
                      //fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
        ));
  }
}
