import 'package:flutter/material.dart';

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
                    'Christian Gonzalez',
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
                  Column(
                    children: const [
                      Text(
                        'FECHAS',
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
                    width: 60,
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
              )
            ],
          ),
        ));
  }
}
