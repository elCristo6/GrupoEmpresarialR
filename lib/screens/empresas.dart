import 'package:flutter/material.dart';

import 'package:grupo_empresarial_r/screens/crearRemision.dart';
import 'package:grupo_empresarial_r/screens/proveAdmin.dart';
import 'package:grupo_empresarial_r/screens/proveedores.dart';

// ignore: camel_case_types
class empresas extends StatelessWidget {
  const empresas({super.key});

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
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Row(
                children: [
                  /*  const SizedBox(
                    height: 65,
                    width: 10,
                  ),*/
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              // builder: (context) => const crearRemision()),
                              builder: (context) => const proveAdmin()),
                        );
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            side: BorderSide(
                                color: Color.fromARGB(255, 196, 196, 196)),
                          ),
                        ),
                        minimumSize:
                            MaterialStateProperty.all(const Size(390, 50)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 228, 226, 226)),
                      ),
                      child: const Text(
                        'COOPRESUR',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      )),
                ],
              ),
            ),
            Row(
              children: [
                const SizedBox(height: 60, width: 10),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            // builder: (context) => const crearRemision()),
                            builder: (context) => const provedores()),
                      );
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          side: BorderSide(
                              color: Color.fromARGB(255, 196, 196, 196)),
                        ),
                      ),
                      minimumSize:
                          MaterialStateProperty.all(const Size(390, 50)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 228, 226, 226)),
                    ),
                    child: const Text(
                      'COOPERMA',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    )),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  height: 60,
                  width: 10,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            // builder: (context) => const crearRemision()),
                            builder: (context) => const crearRemision()),
                      );
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          side: BorderSide(
                              color: Color.fromARGB(255, 196, 196, 196)),
                        ),
                      ),
                      minimumSize:
                          MaterialStateProperty.all(const Size(390, 50)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 228, 226, 226)),
                    ),
                    child: const Text(
                      '  COREMTERCAM',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    )),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  height: 60,
                  width: 10,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            // builder: (context) => const crearRemision()),
                            builder: (context) => const crearRemision()),
                      );
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          side: BorderSide(
                              color: Color.fromARGB(255, 196, 196, 196)),
                        ),
                      ),
                      minimumSize:
                          MaterialStateProperty.all(const Size(390, 50)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 228, 226, 226)),
                    ),
                    child: const Text(
                      '   COOPERCHATCOL',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    )),
              ],
            ),
          ],
        ));
  }
}
