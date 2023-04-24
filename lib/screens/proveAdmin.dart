// ignore: file_names
import 'package:flutter/material.dart';
import 'package:grupo_empresarial_r/screens/nuevaSiderur.dart';
import 'package:grupo_empresarial_r/screens/nuevoProve.dart';

// ignore: camel_case_types
class proveAdmin extends StatefulWidget {
  const proveAdmin({super.key});

  @override
  State<proveAdmin> createState() => _proveAdminState();
}

// ignore: camel_case_types
class _proveAdminState extends State<proveAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
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
              const SizedBox(width: 30),
              Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Grupo',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  Text(
                    'Empresarial R.',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  Text('Administrador',
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
                    'Lista de proveedores',
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
                        'Ultimo',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          height: 1.0, //bajar texto
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Registro',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          // height: 1.5, //bajar texto
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
                          fontSize: 15,
                          color: Colors.black,
                          height: 1.5, //bajar texto
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  Column(
                    children: const [
                      Text(
                        'N° De CONSECUTIVOS',
                        style: TextStyle(
                          fontSize: 15,
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
                                      'Proveedor 1',
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
                            '25',
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
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
              const SizedBox(
                height: 300,
              ),
              TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          // builder: (context) => const crearRemision()),
                          builder: (context) => const nuevoProve()),
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
                    'Crear proveedor',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      //height: 1.5, //bajar texto
                      //fontWeight: FontWeight.bold,
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const nuevaSiderur()),
                      //builder: (context) => const nuevoProve()),
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
                    'Crear empresa',
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
